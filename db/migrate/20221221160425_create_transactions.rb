class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :buyer_phone_number
      t.string :buyer_location
      t.references :user, null: false, foreign_key: true
      t.references :carbon_credit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
