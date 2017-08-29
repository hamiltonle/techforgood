class AddMaxCourseScoreToEnrollments < ActiveRecord::Migration[5.1]
  def change
    add_column :enrollments, :max_course_score, :integer
  end
end
