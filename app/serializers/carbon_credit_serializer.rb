class CarbonCreditSerializer < ActiveModel::Serializer
  attributes :id, :amount, :source, :image, :approved , :price, :location
  belongs_to :user
  has_one :purchase
end
