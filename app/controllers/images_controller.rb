# frozen_string_literal: true


class ImagesController < ApplicationController
  before_action :authenticate_admin!, except: :show
  before_action :set_category_and_images
  before_action :set_attachment, only: %i[show destroy]

  def create
    respond_to do |format|
      if @category.images.attach(images_params[:images])
        format.turbo_stream do
          flash.now[:success] =
            t('flash.success.updated', model: "#{@category.model_name.human} #{@category.title.downcase}")
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @images = @images.select { |image| image.id <= @attachment.id } + @images.select do |image|
                                                                               image.id > @attachment.id
                                                                             end
  end

  def destroy
    respond_to do |format|
      if admin_signed_in? && @attachment.purge_later
        format.turbo_stream { flash.now[:success] = t('flash.success.destroyed', model: t('global.image')) }
      end
    end
  end

  private

  def set_attachment
    @attachment = ActiveStorage::Attachment.find(params[:id])
  end

  def images_params
    params.require(:category).permit(images: [])
  end

  def set_category_and_images
    @category = Category.find(params[:category_id]).decorate
    @images = @category.images_newest
  end
end
