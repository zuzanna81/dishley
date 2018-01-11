Given("the following restaurants exist") do |table|
  table.hashes.each do |restaurant|
    FactoryBot.create(:restaurant, restaurant)
  end
end

Then("I should see {string}") do |content|
  expect(page).to have_content content
end

Then("show me the page") do
  save_and_open_page
end

When("I click on {string} by {string}") do |element, restaurant_name|
  restaurant = Restaurant.find_by(name: restaurant_name)
    within("#restaurant-#{restaurant.id}") do
      click_link_or_button element
  end
end

Then("I should be on the {string} show page") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
