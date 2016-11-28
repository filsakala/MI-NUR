class CreateOpravas < ActiveRecord::Migration
  def change
    create_table :opravas do |t|
      t.integer :rocnik
      t.string :seria
      t.integer :kolo
      t.string :priklady

      t.timestamps null: false
    end
  end
end
