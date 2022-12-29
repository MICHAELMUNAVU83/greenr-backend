class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :carbon_credit
  
end
