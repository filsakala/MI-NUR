class CreateKnizkas < ActiveRecord::Migration
  def change
    create_table :knizkas do |t|
      t.integer :rocnik
      t.string :seria
      t.integer :cislo
      
      t.timestamps null: false
    end
  end
end
