# frozen_string_literal: true

module Admins
  module Gallery
    class ImagesController < ApplicationController
      layout 'profile_layout'
      before_action :authenticate_admin!
      before_action :set_category

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

      private

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