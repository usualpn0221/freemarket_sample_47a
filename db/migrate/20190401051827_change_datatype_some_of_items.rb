class ChangeDatatypeSomeOfItems < ActiveRecord::Migration[5.0]
  def up
    change_column :items, :status, :integer
    change_column :items, :state, :string
  end
end
