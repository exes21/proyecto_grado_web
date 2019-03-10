class CreateCoordinates < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinates do |t|
      t.float :latitude
      t.float :longitude
      t.belongs_to :locatable, polymorphic: true

      t.timestamps
    end
  end
end
