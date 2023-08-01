# frozen_string_literal: true

class Gallery < ApplicationRecord
  mount_uploader  :cover_mobile,  CoverMobileUploader
  mount_uploader  :cover_desktop, CoverDesktopUploader
  acts_as_list sequential_updates: false
  
  has_many :images, -> { order(position: :asc) }, dependent: :destroy
  accepts_nested_attributes_for :images
  
  default_scope { order(position: :asc) }
end
