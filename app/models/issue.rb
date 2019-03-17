class Issue < ApplicationRecord
  belongs_to :data
  belongs_to :user
  belongs_to :access_point
end
