class RemoveAnswerAFromQuizzes < ActiveRecord::Migration[5.1]
  def change
    remove_column :quizzes, :answer_a, :text
    remove_column :quizzes, :answer_b, :text
  end
end
