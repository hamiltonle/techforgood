class AddAnswerAToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :answer_a, :text
  end
end
