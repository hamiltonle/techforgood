class QuestionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @question = Question.new
  end

  def create
    # creating a new question with the parameters from the activeadmin form
    @question = Question.new(question_params)

    # find the lesson the question is being made for
    @lesson = Lesson.find(params[:lesson_id])

    # assigning the lesson to the question
    @question.lesson = @lesson
    @question.save

  end

  def edit
  end

  def update
  end

  private

  def question_params
    params.require(:question).permit(:knowledge_point, :question, :option_a, :option_b, :option_c, :option_d, :answer)
  end

end
