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
      t.belongs_to :riesitel, index: true
      t.belongs_to :seria, index: true
    end
  end
end
