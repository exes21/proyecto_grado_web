class CreatePermisesRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :permises_roles do |t|
      t.belongs_to :permises, foreign_key: true
      t.belongs_to :roles, foreign_key: true

      t.timestamps
    end
  end
end
