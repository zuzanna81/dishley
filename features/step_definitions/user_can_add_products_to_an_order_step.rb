And("I click on {string} for {string}") do |button, product_name|
  product = Product.find_by(name: product_name)
  within "#product-#{product.id}" do
    click_link_or_button button
  end
end

Then("I should see {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should be on the restaurant {string} page") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("an order should have been created in the database") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("{string} should be an order item") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
