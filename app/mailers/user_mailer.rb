# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default to: -> { User.pluck(:email) },
          from: 'infbase-organizer@no-reply.com'

  def email_group(recipients, title, message)
    @title = title || 'Message'
    @message = message || 'No message'

    recipients.each do |recipient|
      mail(
        to: recipient.email,
        subject: @title
      )
    end
  end
end
