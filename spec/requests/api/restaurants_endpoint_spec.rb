require 'rails_helper'


RSpec.describe Api::RestaurantsController, type: :request do
  describe '#index' do
    context 'with anonymous doubles' do
      let!(:restaurants) do
        5.times {create(:restaurant)}
      end

      it 'returns a collection of restaurants' do
        get '/api/restaurants'
        expect(JSON.parse(response.body)['data'].count).to eq 5
      end
    end

    context 'with a specific restaurant' do
      let(:category) {create(:restaurant_category, name: 'Thai')}
      let!(:thai_food) {create(:restaurant,
                               name: 'Thai Palace',
                               description: 'Lovely place.',
                               city: 'Gothenburg',
                               street_address: 'Holtermansgatan 1C',
                               post_code: '410 29',
                               restaurant_category: category)}

      before do
        get '/api/restaurants'
        @json_resp = JSON.parse(response.body)['data'].first

      end

      it 'is a valid request' do
        expect(response.status).to eq 200
      end

      it 'includes restaurant attributes' do
        expect(@json_resp['attributes']['name']).to eq 'Thai Palace'
      end

      it 'includes restaurant category attributes' do
        category = @json_resp['relationships']['restaurant-category']['data']
        expect(category['name']).to eq 'Thai'
      end
    end
  end

  describe '#show' do

    context 'with a specific restaurant' do
      let(:category) {create(:restaurant_category, name: 'Thai')}
      let!(:thai_food) {create(:restaurant,
                               name: 'Thai Palace',
                               description: 'Lovely place.',
                               city: 'Gothenburg',
                               street_address: 'Holtermansgatan 1C',
                               post_code: '410 29',
                               restaurant_category: category)}
      let!(:menu_lunch) {create(:menu, name: 'lunch', restaurant: thai_food)}
      let!(:product_category) {create(:product_category,
                                      name: 'Main courses',
                                      menu: menu_lunch,
                                      restaurant: thai_food)}
      let!(:lunch_box){ create(:product, name: 'Lunch Box',
                               description: 'Marvelous lunch',
                               price: 75,
                               product_category: product_category,
                               restaurant: thai_food,
                               image_file_link: 'http://example.com/image.jpg')}

      before do
        get "/api/restaurants/#{thai_food.id}"
        @json_resp = JSON.parse(response.body)['data']
      end

      it 'is a valid request' do
        expect(response.status).to eq 200
      end

      it 'includes menus' do
        menus = @json_resp['relationships']['menus']['data']
        expect(menus.first['name']).to eq 'lunch'
      end

      it 'includes product categories' do
        product_categories = @json_resp['relationships']['menus']['data'].first['product-categories']
        expect(product_categories.first['name']).to eq 'Main courses'
      end

      it 'includes products' do
        products = @json_resp['relationships']['menus']['data'].first['product-categories'].first['products']
        expect(products.first['name']).to eq 'Lunch Box'
        expect(products.first['price']).to eq 75
      end
    end


  end
end

