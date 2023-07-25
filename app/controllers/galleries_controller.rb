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
    @galleries = Gallery.all.latest.decorate
  end

  def show
    @gallery = Gallery.find(params[:id]).decorate
    @images = @gallery.images
    @images_count = @images.count
    @pagy_a, @images = pagy_array(@images, items: 10)
    
    set_meta_tags(
      title: [t('meta.gallery.title', category: @gallery.title.capitalize)],
      description: t('meta.gallery.desc', category: @gallery.title.downcase),
      alternate: {
        'x-default' => root_url(locale: nil),
        'en' => root_url(locale: :en),
        'he' => root_url(locale: :he),
        'uk' => root_url(locale: :uk),
        'ru' => root_url(locale: :ru)
      }
    )
  end
end
