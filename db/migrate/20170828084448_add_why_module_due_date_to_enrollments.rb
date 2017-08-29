class AddWhyModuleDueDateToEnrollments < ActiveRecord::Migration[5.1]
  def change
    add_column :enrollments, :why_module_due_date, :date
    add_column :enrollments, :what_module_due_date, :date
    add_column :enrollments, :how_module_due_date, :date
  end
end
