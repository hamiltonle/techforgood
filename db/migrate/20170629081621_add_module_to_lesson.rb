class AddModuleToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :module_name, :string
  end
end
