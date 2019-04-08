class Issue < ApplicationRecord
  #belongs_to :user
  belongs_to :access_point
  has_many :issues_reports

  acts_as_commentable

  after_save do
    if status == 'inactivo' && issues_reports.count > Setting.tolerancia
      User.where(role: Role.first).each do |user|
        notification = Notification.new
        notification.user = user
        notification.notificable_id = id
        notification.notificable_type = "Issue"
        notification.save
      end
    end
  end


  accepts_nested_attributes_for :issues_reports
  enum status: [:activo, :inactivo, :cancelado, :resuelto]
end
