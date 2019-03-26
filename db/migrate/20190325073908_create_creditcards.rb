class CreateCreditcards < ActiveRecord::Migration[5.0]
  def change
    create_table :creditcards do |t|
      t.references :user
      t.string :kind,null: false
      t.string :number,null: false
      t.integer :expyear,null: false
      t.integer :expmonth,null: false
      t.string :securitycode,null: false
      t.timestamps
    end
  end
end
