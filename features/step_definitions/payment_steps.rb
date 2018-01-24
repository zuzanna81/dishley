Given('I visit orders page') do
  expect(current_path).to eq orders_path
end

When('I click on {string} button') do |element|
  sleep 5
  click_button element
  sleep 2
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
end

Given('I fill in stripe form field {string} with {string}') do |field, value|
  sleep(2)
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  within_frame @stripe_iframe do
    fill_in field, with: value
  end
end

When('I submit the stripe form') do
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  within_frame @stripe_iframe do
    find('.Section-button>button').click
    sleep 5
  end
end

Then('I should not be redirected to order page') do
  expect(page.current_path).not_to eq orders_path
end

Then('the order should be {string}') do |state|
  sleep 2
  order = Order.last
  expect(order.state).to eq state
end

Then('I should see {string} and the total amount should be {string}') do |text, price|
  expect(page).to have_content "#{text} #{price}"
end
