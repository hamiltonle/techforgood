class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :status
      t.references :user, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
