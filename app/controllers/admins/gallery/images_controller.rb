# frozen_string_literal: true

module Admins
  module Gallery
    class ImagesController < ApplicationController
      before_action :authenticate_admin!
      before_action :set_category
      before_action :set_attachment, only: %i[show destroy]

      def create
        respond_to do |format|
          if @category.images.attach(category_params[:images])
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

      def category_params
        params.require(:category).permit(images: [])
      end

      def set_category
        @category = Category.find(params[:category_id]).decorate
        @images = @category.images_newest
      end
    end
  end
end