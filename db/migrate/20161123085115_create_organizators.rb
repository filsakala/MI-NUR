class CreateOrganizators < ActiveRecord::Migration
  def change
    create_table :organizators do |t|
      t.string :meno
      t.string :priezvisko
      t.string :nick
      t.string :status
      t.string :email
      t.string :telefon

      t.timestamps null: false
    end
  end
end
