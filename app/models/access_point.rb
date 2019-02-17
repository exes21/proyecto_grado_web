class AccessPoint < ApplicationRecord
  has_one :cordinate
  belongs_to :zone
end
