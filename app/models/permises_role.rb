class permissionsRole < ApplicationRecord
  belongs_to :permissions
  belongs_to :roles
end
