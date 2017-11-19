class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|

      #add
      t.string :title
      t.date :date
      t.text :description
      #add_end

      t.timestamps
    end
  end
end
