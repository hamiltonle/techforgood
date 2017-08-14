class QuizzesController < ApplicationController
  def index
  end

  # show quiz results
  def show
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @quiz = Quiz.new
  end

  def create
    # creating a new quiz with the parameters from the simpleform from lesson show
    @quiz = Quiz.new(quiz_params)

    # find the lesson the quiz is related to
    @lesson = Lesson.find(params[:lesson_id])

    # uses current session to assign the session_id
    @current_session = current_user.sessions.where(:lesson_id => @lesson.id)
    @session = @current_session.last

    # assigning the lesson & session to the quiz
    @quiz.lesson = @lesson
    @quiz.session = @session
    @quiz.save

    # maybe use below for when redirecting to the answers
    # begin
    #   @quiz.save
    # rescue => error
    #   redirect_to course_lesson_path(@course.id, @course.lessons.first)
    # end

  end

  def edit
  end

  def update
  end

  private

  def quiz_params
    params.require(:quiz).permit(:attempt, :question_list, :answer_list, :score, :session_id, :lesson_id, :answer_a, :answer_b)
  end
end
