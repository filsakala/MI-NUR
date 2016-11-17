class CreatePriklads < ActiveRecord::Migration
  def change
    create_table :priklads do |t|
      t.string :nazov
      t.string :text, limit: 2048
      t.string :pred_t, limit: 2048
      t.string :po_t, limit: 2048
      t.string :vzorak, limit: 2048
      t.string :autor
      t.string :kategoria
      t.string :stav
      t.belongs_to :kolo, index: true
      t.integer :cislo_v_kole

      t.timestamps null: false
    end
  end
end
