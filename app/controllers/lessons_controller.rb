class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    # do we need to add which course the lesson belongs to?
    # @course = Course.find(params[:oragnization_id])

    @lesson = Lesson.new(lesson_params)
    @lesson.course_id = @course
    @lesson.save

    # redirect_to (admin dashboard)
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)

    # redirect_to (admin dashboard)
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.delete
  end

  private

  def lesson_params
    params.require(:lesson).permit(:video, :text, :description, :title, :course_id)
  end

end
