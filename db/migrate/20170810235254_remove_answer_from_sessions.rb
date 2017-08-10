class RemoveAnswerFromSessions < ActiveRecord::Migration[5.1]
  def change
    remove_column :sessions, :answer, :string
  end
end
