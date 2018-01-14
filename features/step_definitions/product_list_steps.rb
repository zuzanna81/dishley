Given("the following products exist within a specific restaurant") do |table|
  table.hashes.each do |product|
    FactoryBot.create(:product, product)
  end
end

When("I visit the {string} show page") do |restaurant_name|
  visit "/#{restaurant_name}"
end
