# frozen_string_literal: true

class ContactFormsController < ApplicationController
  def create
    @contact = ContactForm.new(contact_form_params)
    @contact.request = request

    respond_to do |format|
      if @contact.deliver
        format.turbo_stream { flash.now[:success] = t('contact_me.flash.success') }
      else
        format.turbo_stream { flash.now[:alert] = t('contact_me.flash.alert') }
      end
    end
  end
  
  private
  
  def contact_form_params
    params.require(:contact_form).permit(:first_name, :last_name, :email, :message)
  end
end
