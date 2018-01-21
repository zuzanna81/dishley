Then("the order should be {string}") do |state|
  order = Order.last
  expect(order.state).to eq state
end

Then("I should see {string} and the total amount should be {string}") do |string, price|
  pending # Write code here that turns the phrase above into concrete actions
end
