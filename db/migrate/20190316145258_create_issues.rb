class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.belongs_to :reportable, polymorphic: true
      t.datetime :since
      t.datetime :until
      t.integer :status
      t.string :description
      t.references :user, foreign_key: true
      t.references :access_point, foreign_key: true
      t.datetime :solved_at

      t.timestamps
    end
  end
end
