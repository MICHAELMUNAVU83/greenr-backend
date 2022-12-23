class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :carbon_credit
  
end
