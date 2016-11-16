class CreateKomentars < ActiveRecord::Migration
  def change
    create_table :komentars do |t|
      t.string :autor
      t.string :text
      t.belongs_to :priklad, index: true

      t.timestamps null: false
    end
  end
end
