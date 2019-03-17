class CreatePermissionsRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions_roles do |t|
      t.belongs_to :permissions, foreign_key: true
      t.belongs_to :roles, foreign_key: true

      t.timestamps
    end
  end
end
