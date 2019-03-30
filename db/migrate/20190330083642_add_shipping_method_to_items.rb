class AddShippingMethodToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :shipping_method, :string
  end
end
