# frozen_string_literal: true

class Category < ApplicationRecord
   mount_uploaders :images, ImageUploader
end
