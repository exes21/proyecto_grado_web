class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :access_point
  has_many :issues_reports

  enum status: [:activo, :inactivo, :cancelado]
end
