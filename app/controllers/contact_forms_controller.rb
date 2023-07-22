# frozen_string_literal: true

class ContactFormsController < ApplicationController
  def create
    @contact = ContactForm.new(contact_form_params)
    @contact.request = request

    respond_to do |format|
      if @contact.deliver
        format.turbo_stream do
          flash.now[:success] =
            'Nice job! You successfully sent me a message. If needed, I will get back to you as soon as possible. In the meantime, check out all my latest articles above.'
        end
      else
        format.turbo_stream { flash.now[:alert] = 'Could not send message' }
      end
    end
  end
  
  private
  
  def contact_form_params
    params.require(:contact_form).permit(:first_name, :last_name, :email, :message)
  end
end
