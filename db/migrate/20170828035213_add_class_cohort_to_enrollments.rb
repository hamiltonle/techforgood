class AddClassCohortToEnrollments < ActiveRecord::Migration[5.1]
  def change
    add_column :enrollments, :class_cohort, :string
  end
end
