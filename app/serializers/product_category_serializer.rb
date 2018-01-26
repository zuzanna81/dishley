class ProductCategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :products
end