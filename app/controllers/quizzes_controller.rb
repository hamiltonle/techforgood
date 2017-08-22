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

    # Assign lesson questions to instance variables
    questions = @quiz.question_list.split(",").map(&:to_i)
    @question1 = @lesson.questions.find(questions[0])
    @question2 = @lesson.questions.find(questions[1])
    @question3 = @lesson.questions.find(questions[2])
    @question4 = @lesson.questions.find(questions[3])
    @question5 = @lesson.questions.find(questions[4])

    @skip_footer = true
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

    # if retaking a quiz, use current session to assign the session_id
    @current_session = current_user.sessions.where(:lesson_id => @lesson.id)

    if @current_session.exists?
      @session = @current_session.last
    else
      # beginning a quiz also creates a session
      @session = @lesson.sessions.new
      @session.user = current_user
      @session.lesson = @lesson
      @session.status = "completed"

      # This finds the enrollment for the current session
      @enrollment = current_user.enrollments.where(:course_id => @course.id).first
      @session.enrollment = @enrollment

      # saves session
      @session.save
    end

    # assigning the lesson & session to the quiz
    @quiz.lesson = @lesson
    @quiz.session = @session

    # assigning number of attempts, according to quizzes with same session id
    @quiz.attempt = Quiz.where(:session_id => @quiz.session_id).count


    # Randomize the questions and assign as the questions list
    theory_ids = []
    @lesson.questions.where(:knowledge_point => "theory").each { |q| theory_ids << q.id }

    definition_ids = []
    @lesson.questions.where(:knowledge_point => "definitions").each { |q| definition_ids << q.id }

    reading_ids = []
    @lesson.questions.where(:knowledge_point => "reading").each { |q| reading_ids << q.id }


    # remove questions which have already been asked
    Quiz.where(:session_id => @quiz.session_id).each do |quiz|
      asked_questions = quiz.question_list.split(",").map(&:to_i)

      theory_ids -= asked_questions
      definition_ids -= asked_questions
      reading_ids -= asked_questions
    end


    # If 1st attempt, creates array of IDs of all questions in the lesson
    if Quiz.where(:session_id => @quiz.session_id).nil?
      total_question_array = (1..@lesson.questions.count).to_a
    # If 2nd/3rd attempt, then remove previously asked questions
    else
      # @quiz.all_question_array = theory_ids + definition_ids + reading_ids
      # total_question_array = @quiz.all_question_array
      total_question_array = (theory_ids + definition_ids + reading_ids).sort
    end


    # Take random questions from knowledge_points and assign to question variable
    # The .delete(questionX) removes any duplicate questions
    question1 = theory_ids.sample
    theory_ids.delete(question1)

    question2 = theory_ids.sample

    question3 = definition_ids.sample
    definition_ids.delete(question3)

    question4 = definition_ids.sample
    question5 = reading_ids.sample

    # Assign lesson questions to instance variables
    @question1 = @lesson.questions.find(question1)
    @question2 = @lesson.questions.find(question2)
    @question3 = @lesson.questions.find(question3)
    @question4 = @lesson.questions.find(question4)
    @question5 = @lesson.questions.find(question5)

    # Assigns the randomly generated questions to question_list attribute as an array, by ID
    @quiz.question_list = "#{question1}, #{question2}, #{question3}, #{question4}, #{question5}"

    # assign correct answers to quiz attributes
    @quiz.correct_answer1 = correct_answer(@question1)
    @quiz.correct_answer2 = correct_answer(@question2)
    @quiz.correct_answer3 = correct_answer(@question3)
    @quiz.correct_answer4 = correct_answer(@question4)
    @quiz.correct_answer5 = correct_answer(@question5)


    # removes other questions which the user has already answered in the past
    # already removed questions 1 & 3 above
    total_question_array.delete(question1)
    total_question_array.delete(question2)
    total_question_array.delete(question3)
    total_question_array.delete(question4)
    total_question_array.delete(question5)

    # save all unanswered questions into quiz
    @quiz.all_question_array = total_question_array

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

    # Assign lesson questions to instance variables
    questions = @quiz.question_list.split(",").map(&:to_i)
    @question1 = @lesson.questions.find(questions[0])
    @question2 = @lesson.questions.find(questions[1])
    @question3 = @lesson.questions.find(questions[2])
    @question4 = @lesson.questions.find(questions[3])
    @question5 = @lesson.questions.find(questions[4])


  end

  def update
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @quiz = Quiz.find(params[:id])

    # increases quiz attempt but limits to 3 tries
    @quiz.attempt += 1

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
