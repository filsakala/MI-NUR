class CreateKnizkaObsahs < ActiveRecord::Migration
  def change
    create_table :knizka_obsahs do |t|
      t.string :nazov
      t.string :text
      t.integer :cislo
      t.belongs_to :knizka, index: true

      t.timestamps null: false
    end
  end
end
