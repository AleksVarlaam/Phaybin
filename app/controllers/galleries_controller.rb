# frozen_string_literal: true

class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all.decorate
  end

  def show
    @gallery = Gallery.find(params[:id]).decorate
    @images = @gallery.images
  end
end
