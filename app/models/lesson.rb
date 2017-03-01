class Lesson < ApplicationRecord
  belongs_to :section
  has_many :videos 
  
  mount_uploader :video, VideoUploader
end
