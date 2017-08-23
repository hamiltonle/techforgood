class Assignment < ApplicationRecord
  belongs_to :lesson
  belongs_to :session

  has_attachments :photos, maximum: 10
end
