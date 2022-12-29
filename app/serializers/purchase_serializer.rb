class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :buyer_phone_number, :buyer_location
  has_one :user
  has_one :carbon_credit
end
