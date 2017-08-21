class AddAnswerListToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :answer_list, :string
  end
end
