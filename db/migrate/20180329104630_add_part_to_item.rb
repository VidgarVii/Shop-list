class AddPartToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :importance, :integer
    add_index :items, :importance
  end
end
