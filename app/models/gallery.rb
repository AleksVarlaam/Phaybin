# frozen_string_literal: true

class Gallery < ApplicationRecord
  mount_uploaders :images, ImageUploader
  mount_uploader  :cover_mobile,  CoverMobileUploader
  mount_uploader  :cover_desktop, CoverDesktopUploader
end
