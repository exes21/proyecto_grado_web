class ZoneDevice < ApplicationRecord
  belongs_to :access_point
  belongs_to :zone
end
