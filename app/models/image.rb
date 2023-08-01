class Image < ApplicationRecord
  belongs_to :gallery
  
  mount_uploader :file, FileUploader
  
  acts_as_list sequential_updates: false
  
  validates :file, presence: true
  validates :position, uniqueness: {scope: :gallery}
  
end
