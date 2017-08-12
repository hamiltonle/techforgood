class AddDueDateToSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :due_date, :datetime
  end
end
