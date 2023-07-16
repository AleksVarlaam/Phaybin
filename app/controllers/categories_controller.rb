# frozen_string_literal: true

class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.decorate
    # @categories = Category.where.not(en: 'Main').decorate
  end
  
  def show
    @category = Category.find(params[:id]).decorate
    @images = @category.images
  end
end

