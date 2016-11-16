class CreateSeria < ActiveRecord::Migration
  def change
    create_table :seria do |t|
      t.string :nazov
      t.integer :rocnik

      t.timestamps null: false
    end
  end
end
