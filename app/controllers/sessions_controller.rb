class SessionsController < ApplicationController
  # Devise authentication exceptions for the following pages:
  # skip_before_action :authenticate_user!, only: [:index, :show]

  # Devise: whitelist all pages for testing
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  #shows the status of lessons on the user dashboard
  def show
    @session = Session.find(params[:id])
  end

  def new
    @session = Session.new
  end

  #marks a lesson as started on the user dashboard
  def create
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @session = @lesson.sessions.new
    @session.user = current_user
    @session.lesson = @lesson
    @session.status = "started"
    @session.save

    redirect_to course_lesson_path(@course.id, @lesson.id)
  end

  def edit
    @session = Session.find(params[:id])
  end

  #updates the lesson status on the user dashboard as the student completes lessons
  def update
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @session = @lesson.sessions.last
    @session.status = "completed"
    @session.update(session_params)
  end

  private

  def session_params
    params.require(:session).permit(:status, :user_id, :lesson_id)
  end
end
