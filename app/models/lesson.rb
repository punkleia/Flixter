class Lesson < ApplicationRecord
  belongs_to :section
  has_many :videos 
  
  include RankedModel
  ranks :row_order, with_same: :section_id
  #mount_uploader :video, VideoUploader
end
