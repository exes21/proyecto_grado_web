require 'sendgrid-ruby'
class NotificationMailer < ApplicationMailer
  default from: "iarw.20111056@gmail.com"

  def notify(issue)
    subject = 'Notificacion de errores'
    @error = issue
    User.where(role: Role.first).each do |user|
      mail(to: user.email, subject: subject).deliver_now
    end
  end
end
