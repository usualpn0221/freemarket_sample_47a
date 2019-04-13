class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
       t.string :pay_id
       t.string :customer_id
       t.references :user

      t.timestamps
    end
  end
end
