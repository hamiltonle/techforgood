class LessonsController < ApplicationController
  # Devise authentication exceptions for the following pages:
  # skip_before_action :authenticate_user!, only: [:index, :show]

  # Devise: whitelist all pages for testing
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  helper_method :fontawesome_icon

  # Displays all lessons of a course
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



  # Displays an individual lesson for a course
  def show
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])

    # passes these instances to the sidebar
    @why_lessons = @course.lessons.where(:module_name => "why")
    @how_lessons = @course.lessons.where(:module_name => "how")
    @what_lessons = @course.lessons.where(:module_name => "what")


    @session = Session.new
    @current_session = current_user.sessions.where(:lesson_id => @lesson.id)

    # after we do unique session validations for unique user_id & lesson_id, then code should be
    # @session = @lesson.sessions.last
    # for now, we'll use this:
    # @session = @lesson.sessions.last

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
    @lesson = Lesson.find(params[:id])
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
