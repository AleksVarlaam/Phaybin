# frozen_string_literal: true

class MainController < ApplicationController
  def index
    set_meta_tags(
      title: [t('meta.main_page.title')],
      description: t('meta.main_page.desc'),
      alternate: {
        'x-default' => root_url(locale: nil),
        'en' => root_url(locale: :en),
        'he' => root_url(locale: :he),
        'uk' => root_url(locale: :uk),
        'ru' => root_url(locale: :ru)
      }
    )
    @galleries = Gallery.latest.decorate.take(2)
    @main_bg  = helpers.asset_path('background/main-page-bg.jpg')
    @contact  = ContactForm.new
  end

  def about_me
    set_meta_tags(
      title: [t('meta.about_me.title')],
      description: t('meta.about_me.desc'),
      alternate: {
        'x-default' => root_url(locale: nil),
        'en' => root_url(locale: :en),
        'he' => root_url(locale: :he),
        'uk' => root_url(locale: :uk),
        'ru' => root_url(locale: :ru)
      }
    )
  end

  def sitemap
    @locales   = I18n.available_locales
    @galleries = Gallery.all
  end

  def robots; end

  def favicon
    respond_to do |format|
      format.png do
        send_file 'app/assets/images/favicon.png', type: 'image/png', disposition: 'inline', sizes: '120x120'
      end
    end
  end
end
