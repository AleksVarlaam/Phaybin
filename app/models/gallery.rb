# frozen_string_literal: true

class Gallery < ApplicationRecord
  mount_uploader  :cover_mobile,  CoverMobileUploader
  mount_uploader  :cover_desktop, CoverDesktopUploader
  
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  
  acts_as_list
  scope :sorted,->  { order(position: :asc) }
end
