# frozen_string_literal: true

module Contents
  class MainController < ApplicationController
    def index
      # @sorted_images = ActiveStorage::Attachment.where(record_type: "Category").order(created_at: :desc)
    end
  end
end
