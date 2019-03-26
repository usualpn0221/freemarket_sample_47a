class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,null: false, index: true
      t.string :description,null: false
      t.string :condition,null: false
      t.string :postage,null: false
      t.string :region,null: false
      t.string :shipping_date,null: false
      t.string :price,null: false
      t.references :saler,null: false
      t.references :buyer



      t.timestamps
    end
  end
end
