class AddCheckbox < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :complete, :boolean, :default => false
  end
end
