class Lesson < ApplicationRecord
  belongs_to :course
  has_many :sessions
  has_many :questions
  has_many :quizzes
end

