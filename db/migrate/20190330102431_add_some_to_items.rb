class AddSomeToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :state, :integer
    add_reference :items, :category, foreign_key: true
  end
end
