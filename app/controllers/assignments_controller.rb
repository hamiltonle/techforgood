class AssignmentsController < ApplicationController

  helper_method :fontawesome_icon
  helper_method :fontawesome_color

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
    # creating a new assignment with the parameters from the simpleform from lesson show
    @assignment = Assignment.new(assignment_params)


    # find the course & lesson the assignment is related to (used in redirect below)
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])

    # if submitting a 2nd assignment, use current session to assign the previously made session_id
    @current_session = current_user.sessions.where(:lesson_id => @lesson.id)

    if @current_session.exists?
      @session = @current_session.last
    else
      # beginning an assignment also creates a session
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

    # assigning the lesson & session to the assignment
    @assignment.lesson = @lesson
    @assignment.session = @session

    # assigning number of attempts, according to assignments with same session id
    @assignment.attempt = Assignment.where(:session_id => @assignment.session_id).count + 1

    @assignment.save

    redirect_to course_lesson_path(@course.id, @lesson.id)
  end


  def edit
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @session = Session.new
    @assignment = Assignment.find(params[:id])
    @current_session = current_user.sessions.where(:lesson_id => @lesson.id).last

    # Assignment Lesson
    if @lesson.lesson_type == "assignment"

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


  def update
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @assignment = Assignment.find(params[:id])

    # updates assignment attributes with user answers
    @assignment.update(assignment_params)

    @assignment.save

    # redirects back to lesson show with updated answer
    redirect_to course_lesson_path(@course.id, @lesson.id)
  end


  private

  # Ensures that only the appropriate values are used to create a lesson
  def assignment_params
    params.require(:assignment).permit(:course_id, :session_id, :lesson_id, :attempt, :user_answer, :mentor_feedback, :score)
  end
end
