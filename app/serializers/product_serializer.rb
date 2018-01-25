class ProductSerializer < ActiveModel::Serializer
  attributes :name, :price
  belongs_to :product_category
