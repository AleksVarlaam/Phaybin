# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @images = Gallery.find_by(en: helpers.device == 'mobile' ? 'Main-mobile' : 'Main-desktop')&.decorate&.images
    @contact  = Contact.new
  end
end
