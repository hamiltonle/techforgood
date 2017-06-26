class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
  end

  def create
    @course = Course.find(params[:course_id])
    @enrollment = @course.enrollments.new
    @enrollment.user = current_user
    @enrollment.save
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.delete
  end
end
