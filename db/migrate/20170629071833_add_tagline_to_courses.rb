class AddTaglineToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :tagline, :string
  end
end
