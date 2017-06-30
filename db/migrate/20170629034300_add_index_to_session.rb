class AddIndexToSession < ActiveRecord::Migration[5.1]
  def change
    add_index :sessions, [:user_id, :lesson_id], :unique => true
  end
end
