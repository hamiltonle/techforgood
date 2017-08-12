class RemoveQuestionFromLessons < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :question, :string
  end
end
