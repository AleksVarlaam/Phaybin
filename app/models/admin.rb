# frozen_string_literal: true

class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :avatar, file_size: { less_than_or_equal_to: 10.megabytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }

  has_one_attached :avatar, dependent: :purge do |attachable|
    attachable.variant(:avatar, resize_to_limit: [400, 400], convert: 'png')
  end

  def avatar_attachment_path
    avatar.attached? ? avatar.variant(:avatar) : 'avatar/avatar-f.png'
  end
end
