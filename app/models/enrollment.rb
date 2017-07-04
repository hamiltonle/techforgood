class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :sessions

  def completed
    self.status == "completed"
  end

end
