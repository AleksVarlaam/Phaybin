# frozen_string_literal: true

class Gallery < ApplicationRecord
  mount_uploader  :cover_mobile,  CoverMobileUploader
  mount_uploader  :cover_desktop, CoverDesktopUploader
  
  has_many :images, dependent: :destroy
end
