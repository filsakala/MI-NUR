class CreatePriklads < ActiveRecord::Migration
  def change
    create_table :priklads do |t|
      t.string :nazov
      t.string :text
      t.string :pred_t
      t.string :po_t
      t.string :vzorak
      t.string :autor
      t.string :kategoria
      t.string :stav
      t.belongs_to :kolo, index: true
      t.integer :cislo_v_kole

      t.timestamps null: false
    end
  end
end
