class CreateRiesitelSeria < ActiveRecord::Migration
  def change
    create_table :riesitel_seria do |t|
      t.string :skola
      t.string :trieda
      t.integer :kategoria
      t.boolean :eriesitel
      t.integer :rocnik
      t.string :seria

      t.timestamps null: false
    end
  end
end
