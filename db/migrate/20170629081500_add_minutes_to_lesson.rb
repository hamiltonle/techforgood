class AddMinutesToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :minutes, :integer
  end
end
