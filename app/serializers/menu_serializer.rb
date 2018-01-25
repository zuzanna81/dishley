class MenuSerializer < ActiveModel::Serializer
  attributes :name
  belongs_to :restaurant
  has_many :product_categories
end
