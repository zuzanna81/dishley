class AddRestaurantsToCategory < ActiveRecord::Migration[5.1]
  def change
    change_table :restaurants do |t|
      t.references :restaurant_category, foreign_key: true
    end
  end
end
