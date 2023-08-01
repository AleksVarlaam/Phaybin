# frozen_string_literal: true

class Gallery < ApplicationRecord
  mount_uploader  :cover_mobile,  CoverMobileUploader
  mount_uploader  :cover_desktop, CoverDesktopUploader
  
  has_many :images, -> { order(position: :asc) }, dependent: :destroy
  accepts_nested_attributes_for :images
  
  acts_as_list
  default_scope { order(position: :asc) }
end
