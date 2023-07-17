# frozen_string_literal: true

class Gallery < ApplicationRecord
   mount_uploaders :images, ImageUploader
end
