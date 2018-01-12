FactoryBot.define do
  factory :restaurant do
    restaurant_category
    name "MyString"
    description "My String"
    city "Goteborg"
    post_code "43168"
    street_address "Stora vägen"
  end
end
