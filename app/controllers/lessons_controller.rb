class LessonsController < ApplicationController
  # Devise authentication exceptions for the following pages:
  skip_before_action :authenticate_user!, only: [:index, :show]

  # Devise: whitelist all pages for testing
  # skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  helper_method :fontawesome_icon
  helper_method :fontawesome_color

  # Displays all lessons of a course. No longer using this page.
  def index
    @course = Course.find(params[:course_id])
    @lessons = @course.lessons.all

    # passes these instances to the sidebar
    @why_lessons = @course.lessons.where(:module_name => "why")
    @how_lessons = @course.lessons.where(:module_name => "how")
    @what_lessons = @course.lessons.where(:module_name => "what")

    @skip_footer = true
  end

  def fontawesome_icon(lesson)
    case lesson.lesson_type
    when "lecture"
      "fa-play-circle"
    when "discussion"
      "fa-comments-o"
    when "quiz"
      "fa-pencil"
    when "assignment"
      "fa-rocket"
    when "article"
      "fa-newspaper-o"
    end
  end

  def fontawesome_color(lesson)
    case lesson.sessions.where(:user_id => current_user.id).last.status
    when "completed"
      "text-success"
    else
      "text-darkgray"
    end
  end

  def class_rank(course, enrollment)
    all_scores = []
    higher_scores_than_user = []

    course.enrollments.where(:class_cohort => enrollment.class_cohort).each do |enrollment|
      all_scores << enrollment.user_score
    end

    higher_scores_than_user = all_scores.compact.select { |a| a >= enrollment.user_score }.count
  end

  # def class_rank(all_scores, enrollment)
  #   higher_scores_than_user = []
  #   higher_scores_than_user = all_scores.select { |a| a >= enrollment.user_score }.count
  # end

  def top_ten(all_scores, course, enrollment)
    top_ten = []

    # CAN PROBABLY USE A SORT BY USER_SCORE METHOD
  end

  # Displays an individual lesson for a course
  def show
    @course = Course.find(params[:course_id])
    @current_enrollment = current_user.enrollments.where(:course_id => @course.id).last
    @lesson = Lesson.find(params[:id])
    @session = Session.new
    @current_session = current_user.sessions.where(:lesson_id => @lesson.id).last

    # total score for a course & current user's score
    @course_max_score = @current_enrollment.max_course_score
    @course_user_current_score = @current_enrollment.user_score

    # class rank and class size
    @course_class_size = @current_enrollment.class_size
    @users_class_rank = class_rank(@course, @current_enrollment)
    # @top_ten = top_ten(@all_scores)


    # Assignment Lesson
    if @lesson.lesson_type == "assignment"
      @assignment = Assignment.new
      @assignment_highscore = 0

      unless @current_session.nil?

        # finds latest assignment for this session, if the student has submitted one before
        # uses the # of attempts to display a 2nd chance or not
        @assignment_attempts = @lesson.assignments.where(:session_id => @current_session.id).last.attempt

        # Finds quiz with highest score
        past_assignment_scores = []
        @lesson.assignments.where(:session_id => @current_session.id).each do |assignment|
          past_assignment_scores << assignment.score
        end
        @assignment_highscore = past_assignment_scores.compact.sort.last

        # For displaying submitted assignments
        @first_assignment = @lesson.assignments.where(:session_id => @current_session.id).first
        @second_assignment = @lesson.assignments.where(:session_id => @current_session.id).last
      end
    end

    # Quiz Lesson
    if @lesson.lesson_type == "quiz"
      @quiz = Quiz.new
      @quiz_highscore = 0

      unless @current_session.nil?

        # finds latest quiz for this session, if the student has taken one before
        @quiz_attempts = @lesson.quizzes.where(:session_id => @current_session.id).last.attempt

        # Finds quiz with highest score
        past_quiz_scores = []
        @lesson.quizzes.where(:session_id => @current_session.id).each do |quiz|
          past_quiz_scores << quiz.score
        end
        @quiz_highscore = past_quiz_scores.compact.sort.last
      end
    end

    # passes these instances to the sidebar
    @why_lessons = @course.lessons.where(:module_name => "why")
    @how_lessons = @course.lessons.where(:module_name => "how")
    @what_lessons = @course.lessons.where(:module_name => "what")

    @skip_footer = true
  end

  # 1st step of creating a lesson: displays form for creating a new lesson
  def new
    @course = Course.find(params[:id])
    @lesson = Lesson.new

  end

  # 2nd step of creating a lesson: grabs form values and creates lesson
  def create
    # do we need to add which course the lesson belongs to?
    # @course = Course.find(params[:oragnization_id])

    @lesson = Lesson.new(lesson_params)
    @lesson.course_id = @course
    @lesson.save

  end

  # 1st step of updating a lesson: displays form for updating a new lesson
  def edit
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
    @session = Session.new
    @current_session = current_user.sessions.where(:lesson_id => @lesson.id).last


    # Assignment Lesson
    if @lesson.lesson_type == "assignment"
      @assignment = Assignment.new
      @assignment_highscore = 0

      unless @current_session.nil?

        # finds latest assignment for this session, if the student has submitted one before
        # uses the # of attempts to display a 2nd chance or not
        @assignment_attempts = @lesson.assignments.where(:session_id => @current_session.id).last.attempt

        # Finds quiz with highest score
        past_assignment_scores = []
        @lesson.assignments.where(:session_id => @current_session.id).each do |assignment|
          past_assignment_scores << assignment.score
        end
        @assignment_highscore = past_assignment_scores.compact.sort.last

        # For displaying submitted assignments
        @first_assignment = @lesson.assignments.where(:session_id => @current_session.id).first
        @second_assignment = @lesson.assignments.where(:session_id => @current_session.id).last
      end
    end

    # passes these instances to the sidebar
    @why_lessons = @course.lessons.where(:module_name => "why")
    @how_lessons = @course.lessons.where(:module_name => "how")
    @what_lessons = @course.lessons.where(:module_name => "what")

    @skip_footer = true
  end

  # 2nd step of updating a lesson: grabs form values and updates lesson
  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)

    # redirect_to (admin dashboard)
  end

  # Deletes a lesson
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.delete
  end

  private

  # Ensures that only the appropriate values are used to create a lesson
  def lesson_params
    params.require(:lesson).permit(:video, :text, :description, :title, :course_id)
  end

end
