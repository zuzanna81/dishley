Given("the following restaurants exist") do |table|
  table.hashes.each do |restaurant|
    FactoryBot.create(:restaurant, restaurant)
  end
end

Then("I should see {string}") do |content|
  expect(page).to have_content content
end
