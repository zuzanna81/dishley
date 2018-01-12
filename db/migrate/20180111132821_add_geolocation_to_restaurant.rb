class AddGeolocationToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :longitude, :float
    add_column :restaurants, :city, :string
    add_column :restaurants, :street_address, :string
    add_column :restaurants, :post_code, :string
  end
end
