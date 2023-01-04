class AddLocationToCarbonCredits < ActiveRecord::Migration[7.0]
  def change
    add_column :carbon_credits, :location, :string
  end
end
