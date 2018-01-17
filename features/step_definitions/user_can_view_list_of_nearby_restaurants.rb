Then("I would not like to see {string}") do |content|
  expect(page).not_to have_content(content)
end
