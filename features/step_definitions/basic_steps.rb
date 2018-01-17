Then("the {string} should be visible") do |selector|
  expect(page).to have_selector :css, "##{selector}"
end

When("I click on {string} link") do |link|
  click_link_or_button link
end

Then("I should be redirected to landing page") do
  expect(current_path).to eq root_path
end
