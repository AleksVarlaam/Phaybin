# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :authenticate_admin!, except: :show
  before_action :set_image, except: :reorder
  before_action :set_gallery_and_images

  def show
    start_index = Image.find(params[:id]).position
    @images = @images.select { |img|
      img.position >= start_index
    } + @images.select do |img|
      img.position < start_index
    end
  end
  
  def reorder
    @image = @gallery.images.find_by position: params[:old_position]
    @image.insert_at params[:new_position]
    
    head :ok
  end
  
  def update
    respond_to do |format|
      if @image.update(images_params)
        format.turbo_stream do
          flash[:success] = 
            t('flash.success.updated', model: "#{@gallery.model_name.human} #{@gallery.title.downcase}")
          redirect_to admins_gallery_path(@gallery, anchor: helpers.dom_id(@image))
        end
      else
        format.html {redirect_to admins_gallery_path(@gallery), status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @image.destroy
        format.turbo_stream do
          flash.now[:success] = t('flash.success.destroyed', model: t('global.image'))
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
    params.require(:image).permit( :gallery_id, :file, :position )
  end
  
  def set_image
    @image = Image.find(params[:id])
  end

  def set_gallery_and_images
    @gallery = Gallery.find(params[:gallery_id]).decorate
    @images = @gallery.images.sorted
  end
end
