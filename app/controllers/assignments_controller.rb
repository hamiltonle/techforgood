class AssignmentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.save
  end


  def edit
  end

  private

  # Ensures that only the appropriate values are used to create a lesson
  def assignment_params
    params.require(:assignment).permit(:course_id, :session_id, :lesson_id, :attempt, :user_answer, :mentor_feedback, :score)
  end
end
