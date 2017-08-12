class Lesson < ApplicationRecord
  belongs_to :course
  has_many :sessions
  has_many :questions
end
