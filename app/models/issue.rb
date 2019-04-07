class Issue < ApplicationRecord
  #belongs_to :user
  belongs_to :access_point
  has_many :issues_reports

  acts_as_commentable

  after_save do
    if issues_reports.count > Setting.tolerancia
      update_attribute(status: :activo)
    end

    if status == 'activo'
      
    end
  end


  accepts_nested_attributes_for :issues_reports
  enum status: [:activo, :inactivo, :cancelado, :resuelto]
end
