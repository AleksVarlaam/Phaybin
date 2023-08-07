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
      description: @gallery.meta_desc,
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
