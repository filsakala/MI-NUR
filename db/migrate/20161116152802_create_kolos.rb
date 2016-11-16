class CreateKolos < ActiveRecord::Migration
  def change
    create_table :kolos do |t|
      t.integer :cislo
      t.integer :rocnik
      t.string :seria

      t.timestamps null: false
    end
  end
end
