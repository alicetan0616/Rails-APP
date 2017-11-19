class DeleteCreateCompletedColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :lists, :complete
    add_column :lists, :completed, :boolean
  end
end
