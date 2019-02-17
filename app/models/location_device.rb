class LocationDevice < ApplicationRecord
  belongs_to :access_point
  belongs_to :coordenate
end
