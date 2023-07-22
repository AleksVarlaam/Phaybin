# frozen_string_literal: true

class ContactForm < MailForm::Base
  attribute :first_name,  validate: true
  attribute :last_name,   validate: true
  attribute :email,       validate: /\A([\w.%+-]+)@([\w-]+\.)+(\w{2,})\z/i
  attribute :message,     validate: true
  attribute :nickname,    captcha: true

  def headers
    {
      to: 'aleksvarlaam@gmail.com', # change this to be the email you want sent to
      subject: 'Phaybin Contact Form',
      from: 'info@chick-chuck.com', # change this to be the email it is coming from
      reply_to: %("#{first_name} #{last_name}" <#{email}>)
    }
  end
end
