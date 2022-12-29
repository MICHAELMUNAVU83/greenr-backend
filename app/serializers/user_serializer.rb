class UserSerializer < ActiveModel::Serializer
  attributes :username, :email , :role
  has_many :carbon_credits
  has_one :purchases
end
