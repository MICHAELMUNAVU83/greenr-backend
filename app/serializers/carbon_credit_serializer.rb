class CarbonCreditSerializer < ActiveModel::Serializer
  attributes :id, :amount, :source, :image, :approved
  belongs_to :user
  has_one :transaction
end
