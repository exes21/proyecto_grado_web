class Role < ApplicationRecord
  has_many :permission_roles
  has_many :permissions, through: :permission_roles

  validates_presence_of :name, message: "can't be blank"
  #validates_presence_of :description, message: "can't be blank"
end
