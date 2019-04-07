class AddLastnameToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :lastname, :string
    add_column :profiles, :firstname, :string
    add_column :profiles, :lastnamekana, :string
    add_column :profiles, :firstnamekana, :string
    add_column :profiles, :prefecture, :string
    add_column :profiles, :phonenumber, :string
  end
end
