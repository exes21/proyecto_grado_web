class CreateZoneDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :zone__devices do |t|
      t.belongs_to :access_point, foreign_key: true
      t.belongs_to :zone, foreign_key: true

      t.timestamps
    end
  end
end
