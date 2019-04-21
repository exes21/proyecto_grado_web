class AddPriorityToIssue < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :priority, :integer, default: 0
  end
end
