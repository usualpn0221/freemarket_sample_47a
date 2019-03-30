class RenameChangeDatatypeToItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :description, :text
    rename_column :items, :condition, :status
  end
end
