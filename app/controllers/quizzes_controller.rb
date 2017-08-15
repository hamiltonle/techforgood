class QuizzesController < ApplicationController
  def index
  end

  # show quiz results
  def show
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @quiz = Quiz.find(params[:id])

    # Randomizes questions

    # Assign questions to view
    @question1 = @lesson.questions.find(1)
    @question2 = @lesson.questions.find(2)
    @question3 = @lesson.questions.find(3)
    @question4 = @lesson.questions.find(4)
    @question5 = @lesson.questions.find(5)


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

    @question1 = @lesson.questions.find(1)
    @question2 = @lesson.questions.find(2)
    @question3 = @lesson.questions.find(3)
    @question4 = @lesson.questions.find(4)
    @question5 = @lesson.questions.find(5)

    # assign correct answers to quiz attributes
    @quiz.correct_answer1 = @question1.answer
    @quiz.correct_answer2 = @question2.answer
    @quiz.correct_answer3 = @question3.answer
    @quiz.correct_answer4 = @question4.answer
    @quiz.correct_answer5 = @question5.answer




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
    params.require(:quiz).permit(:attempt, :question_list, :answer_list, :score, :session_id, :lesson_id, :user_answer1, :user_answer2, :user_answer3, :user_answer4, :user_answer5, :correct_answer1, :correct_answer2, :correct_answer3, :correct_answer4, :correct_answer5)
  end
end
