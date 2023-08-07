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

  def cover
    helpers.device == 'mobile' ? gallery.cover_mobile.webp.url : gallery.cover_desktop.webp.url
  end

  def images_newest
    gallery.images.order(created_at: :desc)
  end
  
  def meta_desc
    case gallery.en.downcase
    when 'men'      then I18n.t('meta.gallery.men')
    when 'women'    then I18n.t('meta.gallery.women')
    when 'magazine' then I18n.t('meta.gallery.magazine')
    when 'book'     then I18n.t('meta.gallery.book')
    else I18n.t('meta.gallery.else', category: title.capitalize)
    end
  end
end
