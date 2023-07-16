# frozen_string_literal: true


class ImagesController < ApplicationController
  before_action :authenticate_admin!, except: :show
  before_action :set_category_and_images

  def create
    respond_to do |format|
      if @category.update(images_params)
        format.turbo_stream do
          flash[:success] = t('flash.success.updated', model: "#{@category.model_name.human} #{@category.title.downcase}")
          redirect_to request.referer
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    start_index = params[:id].to_i
    @images = @images.select.with_index {|img, index| index.to_i >= start_index} + @images.select.with_index {|img, index| index.to_i < start_index}
  end

  def destroy
    respond_to do |format|
      if remove_image_at_index(params[:id].to_i) && @category.save
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
     remain_images = @category.images
    
     deleted_image = remain_images.delete_at(index) 
     deleted_image.try(:remove!)
     @category.images = remain_images
  end

  def images_params
    params.require(:category).permit({images: []})
  end

  def set_category_and_images
    @category = Category.find(params[:category_id]).decorate
    @images = @category.images
  end
end
