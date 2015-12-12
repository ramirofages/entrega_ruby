class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.references :client, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.text :description
      t.integer :total_amount
      t.date :emission_date

      t.timestamps null: false
    end
  end
end
