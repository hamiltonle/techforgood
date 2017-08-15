class AddUserAnswerToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :user_answer1, :text
    add_column :quizzes, :user_answer2, :text
    add_column :quizzes, :user_answer3, :text
    add_column :quizzes, :user_answer4, :text
    add_column :quizzes, :user_answer5, :text
    add_column :quizzes, :correct_answer1, :text
    add_column :quizzes, :correct_answer2, :text
    add_column :quizzes, :correct_answer3, :text
    add_column :quizzes, :correct_answer4, :text
    add_column :quizzes, :correct_answer5, :text
  end
end
