class User < ApplicationRecord
  has_many :courses
  # has_many :sections
  # has_many :lessons
  # has_many :pictures
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def enrolled_in?(course)
  #    enrolled_courses = []
  #    enrollments.each do |enrollment|
  #    enrolled_courses << enrollment.course
  #   # below is equivalent of above

  #   # enrolled_courses = enrollments.collect do |enrollment|
  #   #   enrollment.course
  #   # end
  #   #below is equivalent of both of the above

    # enrolled_courses = enrollments.collect(&:course)
  #   # above is an N+1 query. After changing connections to has_many enrolled courses/through, the below is more acceptable
    

    return enrolled_courses.include?(course)
  end

end
