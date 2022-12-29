class Purchase < ApplicationRecord
  belongs_to :carbon_credit
  belongs_to :user
  
end
