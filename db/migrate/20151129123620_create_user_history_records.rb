class CreateUserHistoryRecords < ActiveRecord::Migration
  def change
    create_table :user_history_records do |t|
    	t.references :user
    	t.datetime :arrival
    	t.boolean :on_time
      t.timestamps
    end
  end
end
