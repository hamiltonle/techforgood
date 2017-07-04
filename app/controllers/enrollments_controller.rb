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


    begin
      @enrollment.save
    rescue => error
      redirect_to course_lessons_path
    end


  end

  # deletes an enrollment if the student decides to cancel the class
  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.delete
  end

  private

  def enrollments_param
    params.require(:enrollment).permit(:course_id, :user_id)
  end
end
