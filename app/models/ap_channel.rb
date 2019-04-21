class ApChannel < ApplicationRecord
  belongs_to :access_point, dependent: :destroy
end
