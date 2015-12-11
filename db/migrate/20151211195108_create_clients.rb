class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :gender
      t.integer :document_number
      t.string :cuit
      t.string :email
      t.integer :phone_number
      t.string :skype

      t.timestamps null: false
    end
  end
end
