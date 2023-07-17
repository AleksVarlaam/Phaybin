# frozen_string_literal: true

class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  def avatar_thumb
    avatar.present? ? avatar.thumb.url : 'avatar/avatar-f.png'
  end

  def avatar_medium
    avatar.present? ? avatar.medium.url : 'avatar/avatar-f.png'
  end

  def avatar_large
    avatar.present? ? avatar.large.url : 'avatar/avatar-f.png'
  end
end
