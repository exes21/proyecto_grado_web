class Role < ApplicationRecord
  has_many :permises

  validates_presence_of :name, message: "can't be blank"
  #validates_presence_of :description, message: "can't be blank"
end
