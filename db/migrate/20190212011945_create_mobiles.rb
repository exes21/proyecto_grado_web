class CreateMobiles < ActiveRecord::Migration[5.2]
  def change
    create_table :mobiles do |t|
      t.string :mac_address
      t.belongs_to :user
      t.timestamps
    end
  end
end
