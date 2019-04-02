class RenameSalerIdColumnToUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :saler_id, :user_id
    rename_column :items, :state, :item_condition
    rename_column :items, :status, :trade_status
  end
end
