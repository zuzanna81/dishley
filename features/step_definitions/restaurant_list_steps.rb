Given("the following restaurants exist") do |table|
  table.hashes.each do |restaurant|
    FactoryBot.create(:restaurant, restaurant)
  end
end
