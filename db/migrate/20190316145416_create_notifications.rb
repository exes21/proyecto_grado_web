class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.belongs_to :notificable, polymorphic: true
      t.string :text
      t.references :user, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
