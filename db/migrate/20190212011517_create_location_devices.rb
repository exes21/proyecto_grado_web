class CreateLocationDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :location_devices do |t|
      t.belongs_to :access_point, foreign_key: true
      t.belongs_to :coordinate, foreign_key: true

      t.timestamps
    end
  end
end
