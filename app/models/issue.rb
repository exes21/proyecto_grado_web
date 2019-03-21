class Issue < ApplicationRecord
  belongs_to :reportable, polymorphic: true
  belongs_to :user
  belongs_to :access_point
end
