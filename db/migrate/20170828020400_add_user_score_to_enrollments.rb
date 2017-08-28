class AddUserScoreToEnrollments < ActiveRecord::Migration[5.1]
  def change
    add_column :enrollments, :user_score, :integer
  end
end
