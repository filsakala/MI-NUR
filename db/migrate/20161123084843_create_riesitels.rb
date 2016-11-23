class CreateRiesitels < ActiveRecord::Migration
  def change
    create_table :riesitels do |t|
      t.string :meno
      t.string :priezvisko
      t.string :adresa
      t.string :datum_narodenia
      t.string :telefon
      t.string :telefon_rodic
      t.string :email

      t.timestamps null: false
    end
  end
end
