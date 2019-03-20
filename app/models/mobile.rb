class Mobile < ApplicationRecord
  belongs_to :user
  has_many :datums
  has_many :coordinates, as: :locatable
  accepts_nested_attributes_for :coordinates

  delegate :name, :email, :phone, to: :user
end
