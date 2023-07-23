# frozen_string_literal: true

class ReviewDecorator < Draper::Decorator
  delegate_all

  def created_at
    l review.created_at, format: :date
  end
  
  def user_name
    review.first_name + ' ' + review.last_name
  end
end