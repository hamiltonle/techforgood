class AddClassSizeToEnrollments < ActiveRecord::Migration[5.1]
  def change
    add_column :enrollments, :class_size, :integer
  end
end
