# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @galleries = Gallery.latest.decorate.take(4)
    @main_bg  = helpers.asset_path('background/main-page-bg.jpg')
    @contact  = ContactForm.new
  end

  def about_me; end

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
