class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :buyer
      t.string :postage,null: false
      t.string :delivery,null: false
      t.string :region,null: false
      t.string :shipping_date,null: false
      t.timestamps
    end
  end
end
