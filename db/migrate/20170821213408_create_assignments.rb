class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :lesson, foreign_key: true
      t.references :session, foreign_key: true
      t.integer :attempt
      t.text :user_answer
      t.text :mentor_feedback
      t.integer :score

      t.timestamps
    end
  end
end
