class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :video
      t.text :text
      t.text :description
      t.string :title
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
