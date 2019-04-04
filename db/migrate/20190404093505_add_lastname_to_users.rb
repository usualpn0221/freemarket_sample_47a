class AddLastnameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lastname, :string
    add_column :users, :firstname, :string
    add_column :users, :lastnamekana, :string
    add_column :users, :firstnamekana, :string
    add_column :users, :birthyear, :integer
    add_column :users, :birthmonth, :integer
    add_column :users, :birthday, :integer

  end
end
