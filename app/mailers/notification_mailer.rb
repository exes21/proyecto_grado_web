require 'sendgrid-ruby'
class NotificationMailer < ApplicationMailer
  default from: "iarw.20111056@gmail.com"

  def notify(user, issue)
    subject = 'Notificacion de errores'
    @error = issue
    @url = "192.168.1.99/alert/#{@error.id}"
    mail(to: user.email, subject: subject)
  end

  def notify_by_email(email, issue)
    subject = 'Notificacion de errores'
    @error = issue
    @url = "192.168.1.99/alert/#{@error.id}"
    mail(to: email, subject: subject)
  end
end
