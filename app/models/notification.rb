require 'sendgrid-ruby'

class Notification < ApplicationRecord
  belongs_to :notificable, polymorphic: true
  belongs_to :user

  include SendGrid

  after_create :notify

  def notify
    NotificationMailer.notify(user, Issue.find(notificable_id)).deliver_now
  end
end
