# frozen_string_literal: true

module ApplicationHelper
  def prepend_flash
    turbo_stream.prepend 'flash_messages', partial: 'shared/messages/flash_messages'
  end
  
  def device
    agent = request.user_agent
    return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return "mobile" if agent =~ /Mobile/
    return "desktop"
  end
end
