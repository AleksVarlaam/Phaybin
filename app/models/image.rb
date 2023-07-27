class Image < ApplicationRecord
  belongs_to :gallery
  
  mount_uploader :file, FileUploader
  validates :file, presence: true
end
