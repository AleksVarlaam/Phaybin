class Review < ApplicationRecord
  validates :email, presence: true, format: /\A([\w.%+-]+)@([\w-]+\.)+(\w{2,})\z/i
  
  mount_uploader :avatar, AvatarUploader

  def avatar_thumb
    avatar.present? ? avatar.thumb.url : 'avatar/avatar-f.png'
  end
end
