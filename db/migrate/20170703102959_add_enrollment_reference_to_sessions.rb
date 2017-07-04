class AddEnrollmentReferenceToSessions < ActiveRecord::Migration[5.1]
  def change
    add_reference :sessions, :enrollment, foreign_key: true
  end
end
