class CreateUservaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :uservaluations do |t|
      t.references :evaluateduser
      t.references :evaluater
      t.string :kind

      t.timestamps
    end
  end
end
