class CreatePermises < ActiveRecord::Migration[5.2]
  def change
    create_table :permises do |t|
      t.string :name
      t.string :subject_class
      t.string :action

      t.timestamps
    end
  end
end
