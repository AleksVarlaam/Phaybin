# frozen_string_literal: true

class ContentsController < ApplicationController
  def index
    # @images = ActiveStorage::Attachment.where(record_type: "Category").order(created_at: :desc)
#     @categories = Category.all.decorate
    @images_mobile  = Category.find_by(en: 'Main-mobile').decorate.images_newest
    @images_desktop = Category.find_by(en: 'Main-desktop').decorate.images_newest
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

