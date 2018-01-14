class AddProductToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :products, :string
  end
end
