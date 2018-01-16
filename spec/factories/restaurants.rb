FactoryBot.define do
  factory :restaurant do
    restaurant_category
    name "Restaurant name"
    description "Restaurant description"
    city "Goteborg"
    post_code "43168"
    street_address "Stora vägen"
  end
end
