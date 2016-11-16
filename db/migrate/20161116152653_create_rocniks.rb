class CreateRocniks < ActiveRecord::Migration
  def change
    create_table :rocniks do |t|
      t.integer :cislo

      t.timestamps null: false
    end
  end
end
