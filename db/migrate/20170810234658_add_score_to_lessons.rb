class AddScoreToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :score, :integer
  end
end
