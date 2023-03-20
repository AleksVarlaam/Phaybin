# frozen_string_literal: true

class ContentsController < ApplicationController
  def index
    @sorted_images = ActiveStorage::Attachment.where(record_type: "Category").order(created_at: :desc)
  end
  
  def gallery
    @categories = Category.all.decorate
  end
  
  def category
    @category = Category.find(params[:id]).decorate
    @images = @category.images_newest
  end
end

