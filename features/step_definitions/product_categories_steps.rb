Given("the following products exist within a specific restaurant and category") do |table|
  table.hashes.each do |product|
    restaurant = Restaurant.find_by(name: product[:restaurant])
    category = FactoryBot.create(:product_category, name: product[:category],
                                                    restaurant: restaurant)
    FactoryBot.create(:product, name: product[:name],
                                          product_category: category,
                                          restaurant: restaurant)
  end
end

Then("I would like to see {string} under the {string} category") do |product, product_category|
  product_category = ProductCategory.find_by(name: product_category)
  within("#product_category-#{product_category.id}") do
    expect(page).to have_content product
    expect(page).to have_content product_category.name
  end
end

Then("I would not like to see {string} under the {string} category") do |product, product_category|
  product_category = ProductCategory.find_by(name: product_category)
  within("#product_category-#{product_category.id}") do
    expect(page).not_to have_content product
  end
end
