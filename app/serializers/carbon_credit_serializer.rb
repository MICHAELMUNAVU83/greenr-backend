class CarbonCreditSerializer < ActiveModel::Serializer
  attributes :id, :amount, :source, :image, :approved , :price
  belongs_to :user
  has_one :purchase
end
