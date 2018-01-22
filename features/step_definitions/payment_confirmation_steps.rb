Then("the order should be {string}") do |state|
  binding.pry
  order = Order.last
  expect(order.state).to eq state
end

Then("I should see {string} and the total amount should be {string}") do |string, price|
  expect(page).to have_content "#{string} #{price} kr"
end
