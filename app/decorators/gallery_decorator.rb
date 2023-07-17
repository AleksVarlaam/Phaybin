# frozen_string_literal: true

class GalleryDecorator < Draper::Decorator
  delegate_all

  def title
    case I18n.locale
    when :ru then gallery.ru
    when :uk then gallery.uk
    when :en then gallery.en
    when :he then gallery.he
    end
  end

  def images_newest
    gallery.images.order(created_at: :desc)
  end
end
