class AddAnswerToSession < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :answer, :string
  end
end
