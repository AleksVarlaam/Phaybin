class ReviewsController < ApplicationController
  before_action :authenticate_admin!, only: :destroy
  
  def index
    @review = Review.new
    @reviews = Review.all.decorate
  end
  
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.turbo_stream { flash.now[:success] = t('contact_me.flash.success') }
      else
        format.turbo_stream { flash.now[:alert] = t('contact_me.flash.alert') }
      end
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    respond_to do |format|
      if @review.destroy
        format.turbo_stream do
          flash.now[:success] = t('flash.success.destroyed', model: @review.model_name.human)
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def review_params
    params.require(:review).permit(:first_name, :last_name, :email, :message, :avatar)
  end
end