class RemovePhonenumberFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :phonenumber, :string
  end
end
