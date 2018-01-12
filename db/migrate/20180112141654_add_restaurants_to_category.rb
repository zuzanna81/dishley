class AddRestaurantsToCategory < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :restaurants, :restaurant_category 
  end
end
