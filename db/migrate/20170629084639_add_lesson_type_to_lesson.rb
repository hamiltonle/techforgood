class AddLessonTypeToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :lesson_type, :string
  end
end
