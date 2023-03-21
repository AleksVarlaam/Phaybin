class ContactsController < ApplicationController
    
    def create
        @contact = Contact.new(params[:contact])
        @contact.request = request
        
        respond_to do |format|
          if @contact.deliver
            format.turbo_stream { flash.now[:success] = 'Nice job! You successfully sent me a message. If needed, I will get back to you as soon as possible. In the meantime, check out all my latest articles above.' }
          else
            format.turbo_stream { flash.now[:alert] = 'Could not send message' }
          end
        end
    end

end
