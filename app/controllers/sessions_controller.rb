class SessionsController < ApplicationController
  # Devise authentication exceptions for the following pages:
  # skip_before_action :authenticate_user!, only: [:index, :show]

  # Devise: whitelist all pages for testing
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

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

  # def lesson_completed
  #   # total course = find the course the student is marking the session as complete for
  #   @course = Course.find(params[:course_id])

  #   # total course lessons = find the number of lessons in the course
  #   total_lessons_in_course = @course.lessons.count

  #   # total users sessions in course completed = find the number of sessions in the course which are marked as completed
  #   current_user.courses.find(@course.id)

  #   if # of completed sessions = # of lessons in course
  #     mark course as completed
  #   else
  #     update progress bar on dashboard
  #   end
  # end

  private

  def session_params
    params.require(:session).permit(:status, :user_id, :lesson_id)
  end
end
