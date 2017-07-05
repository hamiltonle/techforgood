class AddQuestionToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :question, :string
  end
end
