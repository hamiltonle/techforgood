class Session < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :enrollment

  def completed
    self.status == "completed"
  end

  # Below validation already at the database level
  # validates_uniqueness_of :user_id, :scope => [:lesson_id]
end
