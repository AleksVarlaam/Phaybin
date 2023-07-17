# frozen_string_literal: true

class Contact < MailForm::Base
  attribute :first_name,  validate: true
  attribute :last_name,   validate: true
  attribute :email,       validate: /\A([\w.%+-]+)@([\w-]+\.)+(\w{2,})\z/i
  attribute :message,     validate: true
  attribute :nickname,    captcha: true

  def headers
    {
      to: 'you@email.com', # change this to be the email you want sent to
      subject: 'Railscoder Contact Form',
      from: 'admin@yourdomain.com', # change this to be the email it is coming from
      reply_to: %("#{first_name} #{last_name}" <#{email}>)
    }
  end
end
