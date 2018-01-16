Then("I would like to see an image of {string}") do |image|
  expect(page).to have_xpath("//img[contains(@src, \"#{image}\")]")
end
