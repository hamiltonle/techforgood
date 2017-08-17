class AddAllQuestionArrayToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :all_question_array, :string
  end
end
