Then("I would like to see {string} in the {string} category") do |restaurant_name, category_name|
  within "category##{category_name.titleize.gsub('', '').underscore}" do
    expect(page).to have_content category_name
  end
end
