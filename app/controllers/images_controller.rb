# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :authenticate_admin!, except: :show
  before_action :set_gallery_and_images

  def create
    respond_to do |format|
      if @gallery.update(images_params)
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
    @images = @images.select.with_index { |_img, index|
      index.to_i >= start_index
    } + @images.select.with_index do |_img, index|
      index.to_i < start_index
    end
  end

  def destroy
    respond_to do |format|
      if remove_image_at_index(params[:id].to_i) && @gallery.save
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

  def remove_image_at_index(index)
    remain_images = @gallery.images

    deleted_image = remain_images.delete_at(index)
    deleted_image.try(:remove!)
    @gallery.images = remain_images
  end

  def images_params
    params.require(:gallery).permit({ images: [] })
  end

  def set_gallery_and_images
    @gallery = Gallery.find(params[:gallery_id]).decorate
    @images = @gallery.images
  end
end
