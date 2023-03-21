# frozen_string_literal: true

class ContentsController < ApplicationController
  def index
    # @images = ActiveStorage::Attachment.where(record_type: "Category").order(created_at: :desc)
#     @categories = Category.all.decorate
    @images = Category.find_by(en: 'Main').decorate.images_newest
    @contact = Contact.new
  end
  
  def gallery
    @categories = Category.all.decorate
    # @categories = Category.where.not(en: 'Main').decorate
  end
  
  def category
    @category = Category.find(params[:id]).decorate
    @images = @category.images_newest
  end
end

