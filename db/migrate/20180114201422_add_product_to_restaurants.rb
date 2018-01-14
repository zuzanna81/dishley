class AddProductToRestaurants < ActiveRecord::Migration[5.1]
  def change
    change_table :products do |t|
      t.references :restaurants, foreign_key: true
  end
end