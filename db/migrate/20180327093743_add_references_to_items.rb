class AddReferencesToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :cart, foreign_key: true
  end
end
