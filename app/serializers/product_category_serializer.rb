class ProductCategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :products
  belongs_to :menu
