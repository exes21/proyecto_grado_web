class Permission < ApplicationRecord
  has_many :permission_roles
end
