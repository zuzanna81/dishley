Then("I would like to see an image for {string}") do |product_name|
    product = Product.find_by(name: product_name)
    expect(page).to have_css("img[src*='#{product.image_file_link}']")
end
