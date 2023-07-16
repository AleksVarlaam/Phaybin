class MainController < ApplicationController
  
  def index
    @images  = Category.find_by(en: helpers.device == "mobile" ? 'Main-mobile' : 'Main-desktop')&.decorate.images_newest
    @contact = Contact.new
  end
end