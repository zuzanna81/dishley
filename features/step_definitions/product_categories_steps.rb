Given("the following products exist within a specific restaurant and category") do |table|
  table.hashes.each do |product|
    restaurant = Restaurant.find_by(name: product[:restaurant])
    category = FactoryBot.create(:product_category, name: product[:category])
    FactoryBot.create(:product, name: product[:name],
                                          product_category: category,
                                          restaurant: restaurant)
  end
end

Then("I would like to see {string} under the {string} category") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end
