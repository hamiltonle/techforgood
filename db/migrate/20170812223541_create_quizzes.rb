class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.references :lesson, foreign_key: true
      t.references :session, foreign_key: true
      t.integer :attempt
      t.string :question_list
      t.integer :score

      t.timestamps
    end
  end
end
