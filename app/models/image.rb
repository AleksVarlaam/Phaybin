class Image < ApplicationRecord
  belongs_to :gallery
  
  mount_uploader :file, FileUploader
  
  acts_as_list scope: :gallery
  
  validates :file, presence: true
  validates :position, uniqueness: {scope: :gallery}
  
  # default_scope { order(position: :asc) }
end
