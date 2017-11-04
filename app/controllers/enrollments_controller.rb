class EnrollmentsController < ApplicationController
  # Devise authentication exceptions for the following pages:
  # skip_before_action :authenticate_user!, only: [:index, :show]

  # Devise: whitelist all pages for testing
  # skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # finds all enrolled students in a course
  def index
    @enrollments = Enrollment.all
  end

  def new
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.new
  end

  # creates a new enrollment once a student signs up to a course
  def create
    @course = Course.find(params[:course_id])
    @enrollment = @course.enrollments.new
    @enrollment.user = current_user
    @enrollment.course = @course
    @enrollment.user_score = 0
    @enrollment.max_course_score = max_course_score(@course)

    # assigning due dates for modules
    # due_dates commented out to trouble-shoot
    # due_dates = @course.module_duration.split(",").map(&:to_i)
    # set due_dates to 1 to trouble-shoot
    due_dates = 1
    @enrollment.why_module_due_date = @course.start_date + (due_dates[0] * 7)
    @enrollment.what_module_due_date = @course.start_date + ((due_dates[0] + due_dates[1]) * 7)
    @enrollment.how_module_due_date = @course.start_date + ((due_dates[0] + due_dates[1] + due_dates[2]) * 7)

    # ...Need to set class size manually
    # @enrollment.class_size = Enrollment.where(:class_cohort => @course.id)


    begin
      @enrollment.save
    rescue => error
      redirect_to course_lesson_path(@course.id, @course.lessons.first)
    end
  end

  def max_course_score(course)
    max_score = 0
    course.lessons.each do |lesson|
      # Commented out for trouble-shooting
      # max_score += lesson.score
      # max_score = 0 for trouble-shooting
      max_score += 0
    end
    max_score
  end

  # deletes an enrollment if the student decides to cancel the class
  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.delete
  end

  def status

  end

  private

  def enrollments_param
    params.require(:enrollment).permit(:course_id, :user_id)
  end
end
