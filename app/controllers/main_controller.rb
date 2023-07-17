# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @images = Gallery.find_by(en: helpers.device == 'mobile' ? 'Main-mobile' : 'Main-desktop')&.decorate&.images
    @contact  = Contact.new
  end
  
  def sitemap
    @locales   = I18n.available_locales
    @galleries = Gallery.all
  end

  def robots; end

  def favicon
    respond_to do |format|
      format.png do
        # send_file 'app/assets/images/favicon.png', type: 'image/png', disposition: 'inline', sizes: '120x120'
      end
    end
  end
end
