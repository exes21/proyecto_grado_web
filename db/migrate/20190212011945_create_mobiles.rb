class CreateMobiles < ActiveRecord::Migration[5.2]
  def change
    create_table :mobiles do |t|
      t.string :modelo
      t.string :mac_address

      t.timestamps
    end
  end
end
