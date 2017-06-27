class EnrollmentsController < ApplicationController
  # Devise authentication exceptions for the following pages:
  # skip_before_action :authenticate_user!, only: [:index, :show]

  # Devise: whitelist all pages for testing
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # finds all enrolled students in a course
  def index
    @enrollments = Enrollment.all
  end

  # creates a new enrollment once a student signs up to a course
  def create
    @course = Course.find(params[:course_id])
    @enrollment = @course.enrollments.new
    @enrollment.user = current_user
    @enrollment.save
  end

  # deletes an enrollment if the student decides to cancel the class
  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.delete
  end
end
