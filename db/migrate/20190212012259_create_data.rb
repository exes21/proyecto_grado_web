class CreateData < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.belongs_to :mobile, foreign_key: true
      t.string :type
      t.string :value

      t.timestamps
    end
  end
end
