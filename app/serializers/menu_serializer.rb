class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :product_categories

  def product_categories
    object.product_categories.map do |prod_category|
      ProductCategorySerializer.new(prod_category).as_json
    end
  end
end