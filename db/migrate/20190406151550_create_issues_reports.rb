class CreateIssuesReports < ActiveRecord::Migration[5.2]
  def change
    create_table :issues_reports do |t|
      t.references :issue, foreign_key: true
      t.references :data, foreign_key: true

      t.timestamps
    end
  end
end
