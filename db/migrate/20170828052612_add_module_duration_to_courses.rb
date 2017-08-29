class AddModuleDurationToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :module_duration, :string
  end
end
