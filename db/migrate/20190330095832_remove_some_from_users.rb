class RemoveSomeFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :lastname, :string
    remove_column :users, :firstname, :string
    remove_column :users, :lastnamekana, :string
    remove_column :users, :firstnamekana, :string
    remove_column :users, :birthyear, :integer
    remove_column :users, :birthmonth, :integer
    remove_column :users, :birthday, :integer
    remove_column :users, :postnumber, :string
    remove_reference :users, :prefecture, foreign_key: true
    remove_column :users, :shikuchouson, :string
    remove_column :users, :banchi, :string
    remove_column :users, :tatemonomei, :string
    remove_column :users, :phonenumber, :string
  end
end
