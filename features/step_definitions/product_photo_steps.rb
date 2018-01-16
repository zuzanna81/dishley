Then("I would like to see an image for {string}") do |product_name|
  product = Product.find_by(name: product_name)
  image = product.name.parameterize.underscore
  within("#product-#{product.id}") do
    expect(page).to have_css("img[src*='#{image}']")
  end
end
