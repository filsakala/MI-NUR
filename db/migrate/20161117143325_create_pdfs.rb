class CreatePdfs < ActiveRecord::Migration
  def change
    create_table :pdfs do |t|
      t.belongs_to :knizka
      t.timestamps null: false
    end
  end
end
