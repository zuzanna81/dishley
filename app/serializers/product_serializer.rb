class ProductSerializer < ActiveModel::Serializer
  attributes :name, :price, :image_file_link
end
