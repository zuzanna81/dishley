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
        expect(@json_resp['attributes']['description']).to eq 'Lovely place.'
        expect(@json_resp['attributes']['city']).to eq 'Gothenburg'
        expect(@json_resp['attributes']['post-code']).to eq '410 29'
        expect(@json_resp['attributes']['street-address']).to eq 'Holtermansgatan 1C'
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
      let!(:product_category) {create(:product_category, name: 'Main', menu: menu_lunch, restaurant: thai_food)}

      before do
        get '/api/restaurants'
        @json_resp = JSON.parse(response.body)['data'].first
      end

      it 'is a valid request' do
        expect(response.status).to eq 200
      end

      it 'includes menus' do
        menus = @json_resp['relationships']['menus']['data']
        expect(menus.first['name']).to eq 'lunch'
      end

      it 'includes product categories' do
        product_categories = @json_resp['relationships']['product-categories']['data']
        expect(product_category['name']).to eq 'Main'
      end

      it 'includes products' do
        products = @json_resp['relationships']['products']['data']
        expect(products.size).to eq 0
      end
    end
    describe '#show' do
      context 'with anonymous doubles' do
        let!(:menus) do
          3.times {create(:menus)}
        end

        context 'returns a collection of menus' do
        get '/api/restaurants/:id'
          expect(JSON.parse(response.body)['data'].count).to eq 3
        end
      end

        context 'with a specific restaurant' do
        let!(:thai_food) {create(:restaurant,
                                 name: 'Thai Palace')}
        let!(:menu_lunch) {create(:menu, name: 'lunch', restaurant: thai_food)}
        let!(:product_category) {create(:product_category, name: 'Main', menu: menu_lunch, restaurant: thai_food)}
        let!(:product) {create(name: 'Ratatouille',
                        description: 'Like the movie but better',
                        price: 50.500,
                        restaurant: thai_food,
                        product_category: product_category_main)}
        end

    before do
      get '/api/restaurants/:id'
      @json_resp = JSON.parse(response.body)['data'].first
    end

    it 'is a valid request' do
      expect(response.status).to eq 200
    end

    it 'includes menu attributes' do
      expect(@json_resp['attributes']['name']).to eq 'lunch'
    end

    it 'includes product categories' do
      product_categories = @json_resp['relationships']['product-categories']['data']
      expect(product_category['name']).to eq 'Main'
    end

    it 'includes products' do
      products = @json_resp['relationships']['products']['data']
      expect(products.size).to eq 'Ratatouille'
    end
  end
end
end
