class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :buyer_phone_number, :buyer_location
  belongs_to :carbon_credit
  belongs_to :user
end
