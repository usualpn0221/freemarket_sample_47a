class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,null: false, index: true
      t.text :description,null: false
      t.string :status,null: false, default: 1
      t.string :price,null: false
      t.references :saler,null: false
      t.integer :state,null: false
      t.references :category,null: false
      t.references :brand,null: false, default: 1
      t.string :saizu,null: false, default: ""



      t.timestamps
    end
  end
end
