class UserSerializer < ActiveModel::Serializer
  attributes :username, :email , :role , :id
  has_many :carbon_credits
  has_many :purchases
end
