class RemoveLastnameFromProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :lastname, :string
    remove_column :profiles, :firstname, :string
    remove_column :profiles, :lastnamekana, :string
    remove_column :profiles, :firstnamekana, :string
    remove_column :profiles, :birthyear, :integer
    remove_column :profiles, :birthmonth, :integer
    remove_column :profiles, :birthday, :integer
  end
end
