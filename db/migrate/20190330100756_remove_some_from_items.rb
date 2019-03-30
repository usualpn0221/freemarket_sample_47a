class RemoveSomeFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :buyer, foreign_key: true
    remove_column :items, :postage, :string
    remove_column :items, :region, :string
    remove_column :items, :shipping_date, :string
  end
end
