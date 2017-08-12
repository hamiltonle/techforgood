class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :lesson, foreign_key: true
      t.string :knowledge_point
      t.text :question
      t.text :option_a
      t.text :option_b
      t.text :option_c
      t.text :option_d
      t.text :answer

      t.timestamps
    end
  end
end
