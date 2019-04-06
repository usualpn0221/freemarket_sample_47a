class RemovePrefectureFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_reference :profiles, :prefecture, null:false
  end
end
