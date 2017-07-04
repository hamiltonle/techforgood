class Organization < ApplicationRecord
  has_many :courses

  has_attachments :photos, maximum: 10
end
