class CreatePermises < ActiveRecord::Migration[5.2]
  def change
    create_table :permises do |t|
      t.string :object
      t.string :method

      t.timestamps
    end
  end
end
