class Course < ApplicationRecord
  belongs_to :organization
  has_many :lessons
  has_many :enrollments

  has_attachments :photos, maximum: 10
end
