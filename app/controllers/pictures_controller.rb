class PicturesController < ApplicationController
before_action :authenticate_user!

def new
  @picture = Picture.new
end

def create
  @course = Course.find(params[:course_id])

  @course.picture.create(picture_params)
    redirect_to course_path(current_course)
end

def show
end

private

def image_params
  params.require(:image).permit(:caption, :picture)
end

end
