class IssueNotify < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :notified, :boolean, default: :false
  end
end
