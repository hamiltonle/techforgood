class QuizzesController < ApplicationController
  def index
  end

  # show quiz results
  def show
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @quiz = Quiz.find(params[:id])
    @session = Session.new

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
    @quiz = Quiz.new

    # find the course & lesson the quiz is related to (used in redirect below)
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])

    # uses current session to assign the session_id
    @current_session = current_user.sessions.where(:lesson_id => @lesson.id)
    @session = @current_session.last

    # assigning the lesson & session to the quiz
    @quiz.lesson = @lesson
    @quiz.session = @session

    # marking attempt # as 0 by default
    @quiz.attempt = 0

    @question1 = @lesson.questions.find(1)
    @question2 = @lesson.questions.find(2)
    @question3 = @lesson.questions.find(3)
    @question4 = @lesson.questions.find(4)
    @question5 = @lesson.questions.find(5)

    # assign correct answers to quiz attributes
    @quiz.correct_answer1 = correct_answer(@question1)
    @quiz.correct_answer2 = correct_answer(@question2)
    @quiz.correct_answer3 = correct_answer(@question3)
    @quiz.correct_answer4 = correct_answer(@question4)
    @quiz.correct_answer5 = correct_answer(@question5)

    @quiz.save

    # maybe use below for when redirecting to the answers
    # begin
    #   @quiz.save
    # rescue => error
    redirect_to edit_course_lesson_quiz_path(@course.id, @lesson.id, @quiz.id)
    # end

  end

  def correct_answer(question)
    # 1. takes question.correct_answerX
    abcd_answer = question.answer
    # 2. if a, then option_a, else b, then option_b, etc.
    # 3. returns exact string, according to answer
    case abcd_answer
    when "a"
      question.option_a
    when "b"
      question.option_b
    when "c"
      question.option_c
    else "d"
      question.option_d
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @quiz = Quiz.find(params[:id])

    @question1 = @lesson.questions.find(1)
    @question2 = @lesson.questions.find(2)
    @question3 = @lesson.questions.find(3)
    @question4 = @lesson.questions.find(4)
    @question5 = @lesson.questions.find(5)
  end

  def update
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @quiz = Quiz.find(params[:id])

    # updates quiz attributes with user answers
    @quiz.update(quiz_params)

    # Assess User answers, assign score, and save
    @quiz.score = quiz_score(@quiz)
    @quiz.save

    # redirect_to quiz show with answers
    # if quiz has a score, then quiz show has button to retake
    redirect_to course_lesson_quiz_path(@course.id, @lesson.id, @quiz.id)
  end

  def quiz_score(quiz)
    score = 0
    score += question_correctness(quiz.user_answer1, quiz.correct_answer1)
    score += question_correctness(quiz.user_answer2, quiz.correct_answer2)
    score += question_correctness(quiz.user_answer3, quiz.correct_answer3)
    score += question_correctness(quiz.user_answer4, quiz.correct_answer4)
    score += question_correctness(quiz.user_answer5, quiz.correct_answer5)
  end

  def question_correctness(user_answer, correct_answer)
    user_answer == correct_answer ? 1 : 0
  end

  private

  def quiz_params
    params.require(:quiz).permit(:attempt, :question_list, :answer_list, :score, :session_id, :lesson_id, :user_answer1, :user_answer2, :user_answer3, :user_answer4, :user_answer5, :correct_answer1, :correct_answer2, :correct_answer3, :correct_answer4, :correct_answer5)
  end
end
