# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :authenticate_admin!, except: :show
  before_action :set_gallery_and_images

  def create
    @image = Image.new(images_params)
    @image.gallery_id = @gallery.id
    respond_to do |format|
      if @image.save
        format.turbo_stream do
          flash[:success] = t('flash.success.updated', model: "#{@gallery.model_name.human} #{@gallery.title.downcase}")
          redirect_to request.referer
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    start_index = params[:id].to_i
    @images = @images.select { |img|
      img.id >= start_index
    } + @images.select do |img|
      img.id < start_index
    end
  end

  def destroy
    @image = Image.find(params[:id])
    respond_to do |format|
      if @image.destroy
        format.html do
          flash[:success] = t('flash.success.destroyed', model: t('global.image'))
          redirect_to request.referer
        end
      else
        format.html do
          flash[:error] = t('flash.alert')
          redirect_to request.referer
        end
      end
    end
  end

  private

  def images_params
    params.require(:image).permit( :gallery_id, :file )
  end

  def set_gallery_and_images
    @gallery = Gallery.find(params[:gallery_id]).decorate
    @images = @gallery.images
  end
end
