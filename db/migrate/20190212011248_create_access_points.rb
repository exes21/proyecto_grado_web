class CreateAccessPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :access_points do |t|
      t.string :ip_address
      t.string :mac_address
      t.string :user
      t.string :password
      t.integer :status

      t.timestamps
    end
  end
end
