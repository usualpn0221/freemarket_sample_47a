class CreatePhonenumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phonenumbers do |t|
      t.string :phonenumber,null: false
      t.references :user
      t.timestamps
    end
  end
end
