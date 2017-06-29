class AddModuleToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :module, :string
  end
end
