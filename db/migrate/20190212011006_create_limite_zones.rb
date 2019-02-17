class CreateLimiteZones < ActiveRecord::Migration[5.2]
  def change
    create_table :limite_zones do |t|
      t.belongs_to :zones, foreign_key: true
      t.belongs_to :coordinate, foreign_key: true

      t.timestamps
    end
  end
end
