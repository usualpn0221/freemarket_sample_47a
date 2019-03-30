class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :lastname,null: false
      t.string :firstname,null: false
      t.string :lastnamekana,null: false
      t.string :firstnamekana,null: false
      t.integer :birthyear,null: false
      t.integer :birthmonth,null: false
      t.integer :birthday,null: false
      t.string :postnumber,null: false
      t.references :prefecture,null: false
      t.string :shikuchouson,null: false
      t.string :banchi,null: false
      t.string :tatemonomei
      t.string :phonenumber,null: false

      t.timestamps
    end
  end
end
