class AddStartDateToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :start_date, :date
  end
end
