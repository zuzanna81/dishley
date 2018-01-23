Then("the order should be {string}") do |state|
  sleep 2
  order = Order.last
  expect(order.state).to eq state
end

Then("I should see {string} and the total amount should be {string}") do |text, price|
  expect(page).to have_content "#{text} #{price}"
end
