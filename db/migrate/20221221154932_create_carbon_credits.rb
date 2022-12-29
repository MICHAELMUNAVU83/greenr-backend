class CreateCarbonCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :carbon_credits do |t|
      t.string :amount
      t.integer :price
      t.string :source
      t.string :image
      t.boolean :approved , default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
