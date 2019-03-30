class AddSomeToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :state, :string
    add_reference :items, :category, foreign_key: true
  end
end
