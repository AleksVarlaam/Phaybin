# frozen_string_literal: true

class GalleriesController < ApplicationController
  def index
    set_meta_tags(
      title: [t('meta.portfolio.title')],
      description: t('meta.portfolio.desc'),
      alternate: {
        'x-default' => root_url(locale: nil),
        'en' => root_url(locale: :en),
        'he' => root_url(locale: :he),
        'uk' => root_url(locale: :uk),
        'ru' => root_url(locale: :ru)
      }
    )
    @galleries = Gallery.sortable.decorate
  end

  def show
    @gallery = Gallery.find(params[:id]).decorate
    @images = @gallery.images
    @pagy, @images = pagy_countless(@images, items: 5)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
    
    set_meta_tags(
      title: [t('meta.gallery.title', category: @gallery.title.capitalize)],
      description: meta_desc(@gallery),
      alternate: {
        'x-default' => root_url(locale: nil),
        'en' => root_url(locale: :en),
        'he' => root_url(locale: :he),
        'uk' => root_url(locale: :uk),
        'ru' => root_url(locale: :ru)
      }
    )
  end
  
  private 
  
  def meta_desc(gallery)
    case gallery.en.downcase
    when 'men'      then t('meta.gallery.men')
    when 'women'    then t('meta.gallery.women')
    when 'magazine' then t('meta.gallery.magazine')
    when 'book'     then t('meta.gallery.book')
    else t('meta.gallery.else', category: gallery.title.downcase)
    end
  end
end
