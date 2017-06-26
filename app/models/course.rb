class Course < ApplicationRecord
  belongs_to :organization
  has_many :lessons
  has_many :enrollments
end
