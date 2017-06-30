class RemoveTypeToLesson < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :type, :string
  end
end
