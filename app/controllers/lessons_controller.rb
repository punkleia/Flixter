class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def new
    @course = Course.find(params[:course_id])
    @lesson = Lesson.new
  end

  def show
  end

  private

  def require_authorized_for_current_lesson
   if !current_user.enrolled_in?(current_lesson.section.course) #need the .section.course for id sake
        redirect_to course_path(current_lesson.section.course), alert: "Enroll to see lessons"       
    #don't need anything on the show.html.erb page
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  # def current_course
  #   @current_course ||= Course.find(params[:course_id])
  # end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video)
  end
end

 