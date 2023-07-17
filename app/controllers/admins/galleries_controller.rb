# frozen_string_literal: true

module Admins
  class GalleriesController < ApplicationController
    layout 'profile_layout'
    before_action :authenticate_admin!
    before_action :set_gallery, only: %i[show edit update destroy]

    def new
      @gallery = Gallery.new
    end

    def show
      @images = @gallery.images
    end

    def create
      @gallery = Gallery.new(gallery_params).decorate
      respond_to do |format|
        if @gallery.save
          format.turbo_stream do
            flash.now[:success] =
              t('flash.success.created', model: "#{@gallery.model_name.human} #{@gallery.title.downcase}")
          end
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def index
      @galleries = Gallery.all.decorate
    end

    def edit; end

    def update
      respond_to do |format|
        if @gallery.update(gallery_params)
          format.turbo_stream do
            flash.now[:success] =
              t('flash.success.updated', model: "#{@gallery.model_name.human} #{@gallery.title.downcase}")
          end
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      respond_to do |format|
        if @gallery.destroy
          format.turbo_stream do
            flash.now[:success] = t('flash.success.destroyed', model: @gallery.model_name.human)
          end
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    private

    def gallery_params
      params.require(:gallery).permit(:ru, :en, :he, :uk, images: [])
    end

    def set_gallery
      @gallery = Gallery.find_by_id(params[:id]).decorate
    end
  end
end

