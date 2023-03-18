module ApplicationHelper
  
  def prepend_flash
    turbo_stream.prepend 'flash_messages', partial: 'shared/messages/flash_messages'
  end
end
