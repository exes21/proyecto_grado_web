class CreateAccessPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :access_points do |t|
      t.string :ssid
      t.string :ip_address
      t.string :mac_address
      t.belongs_to :zone
      t.string :user
      t.string :password
      t.integer :status

      t.timestamps
    end
  end
end
