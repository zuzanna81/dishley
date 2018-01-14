Given("the following products exist within a specific restaurant") do |product|
  table.hashes.each do |product|
  FactoryBot.create(:product, product
  )
end

When("I visit the {string} show page") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
