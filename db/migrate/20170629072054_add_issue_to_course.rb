class AddIssueToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :issue, :string
  end
end
