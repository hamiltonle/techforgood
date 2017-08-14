class AddAnswerBToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :answer_b, :text
  end
end
