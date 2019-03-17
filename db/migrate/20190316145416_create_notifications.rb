class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :issue, foreign_key: true
      t.string :text
      t.references :user, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
