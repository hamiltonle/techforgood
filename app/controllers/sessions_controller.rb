class SessionsController < ApplicationController
  # Devise authentication exceptions for the following pages:
  skip_before_action :authenticate_user!, only: [:index, :show]

  # Devise: whitelist all pages for testing
  # skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  #shows the status of lessons on the user dashboard
  def show
    @session = Session.find(params[:id])
  end

  def new
    @session = Session.new
  end

  #marks a lesson as started on the user dashboard
  def create
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @session = @lesson.sessions.new
    @session.user = current_user
    @session.lesson = @lesson
    @session.status = "completed"

    # This finds the enrollment for the current session
    @enrollment = current_user.enrollments.where(:course_id => @course.id).first
    @session.enrollment = @enrollment

    begin
      @session.save
    rescue => error
      redirect_to course_lesson_path(@course.id, @lesson.id)
    end

    # total course = find the course the student is marking the session as complete for
    @course = Course.find(params[:course_id])

    # total course lessons = find the number of lessons in the course
    total_lessons_in_course = @course.lessons.count

    # total users sessions in course completed = find the number of sessions in the course which are marked as completed
    @to_be_completed_enrollment = current_user.enrollments.where(:course_id => @course.id).first
    @completed_sessions = @to_be_completed_enrollment.sessions.where(:status => "completed")

    if @completed_sessions.count == total_lessons_in_course
      @to_be_completed_enrollment.status = "completed"
    end

    @to_be_completed_enrollment.save


    # updating the enrollment user_score attribute with the user's latest score
    @enrollment = @session.enrollment
    @enrollment.user_score = course_user_current_score(@enrollment, current_user)
    @enrollment.save
  end

  def course_user_current_score(enrollment, user)
    # NOTE: This should later be refactored so that it updates an attribute
    #       for enrollments.  Enrollments should have attributes for 1)# of
    #       total students, 2) max score for the course, and 3) user's current
    #       score for the course

    user_score = 0

    user.sessions.where(:enrollment_id => enrollment.id).each do |session|
      if session.lesson.lesson_type == "assignment"
        all_assignment_scores = []

        session.assignments.each do |assignment|
          all_assignment_scores << assignment.score
        end

        user_score += all_assignment_scores.compact.sort.last
      elsif session.lesson.lesson_type == "quiz"
        all_quiz_scores = []

        session.quizzes.each do |quiz|
          all_quiz_scores << quiz.score
        end

        user_score += all_quiz_scores.compact.sort.last
      else
        user_score += session.lesson.score
      end
    end
    user_score
  end

  def edit
    @session = Session.find(params[:id])
  end

  #updates the lesson status on the user dashboard as the student completes lessons
  def update
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])

    # after we do unique session validations for unique user_id & lesson_id, then code should be
    # @session = @lesson.session
    # for now, we'll use this:
    @session = @lesson.sessions.last

    @session.status = "completed"
    @session.update(session_params)
  end

  private

  def session_params
    params.require(:session).permit(:status, :user_id, :lesson_id)
  end
end
