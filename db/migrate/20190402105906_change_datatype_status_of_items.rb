class ChangeDatatypeStatusOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :trade_status, :string
  end
end
