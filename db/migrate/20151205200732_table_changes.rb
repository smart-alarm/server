class TableChanges < ActiveRecord::Migration
  def change
  	remove_column :user_history_records, :user_id, :integer
  	add_column :user_history_records, :uuid, :string
  end
end
