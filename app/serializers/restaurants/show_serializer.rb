class Restaurants::ShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :city, :post_code, :street_address
  has_many :menus

  def menus
    object.menus.map do |menu|
      MenuSerializer.new(menu).as_json
    end
  end
end
