When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

Given("the following user exists") do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end
