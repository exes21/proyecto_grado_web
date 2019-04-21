class IssueCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :category, :integer, default: 0
  end
end
