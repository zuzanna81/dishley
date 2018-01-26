require 'rails_helper'

RSpec.describe Api::RestaurantCategoriesController, type: :request do
  describe '#index' do
    context 'with anonymous doubles' do
      let!(:restaurant_categories) do
        5.times {create(:restaurant_category)}
      end

      it 'returns a collection of restaurant_categories' do
        get '/api/restaurant_categories'
        expect(JSON.parse(response.body)['data'].count).to eq 5
      end
    end

    context 'within a specific restaurant_category' do
      let(:category) {create(:restaurant_category, name: 'Thai')}
      let!(:thaipalace) {create(:restaurant,
                               name: 'Thai Palace',
                               description: 'Lovely place.',
                               city: 'Gothenburg',
                               street_address: 'Holtermansgatan 1C',
                               post_code: '410 29',
                               restaurant_category: category)}
       before do
         get '/api/restaurant_categories'
         @json_resp = JSON.parse(response.body)['data'].first
       end

       it 'is a valid request' do
         expect(response.status).to eq 200
       end

       it 'includes restaurant category attributes' do
         expect(@json_resp['attributes']['name']).to eq 'Thai'
       end

       it 'includes restaurant attributes' do
         restaurants = @json_resp['relationships']['restaurants']['data']
         expect(restaurants.first['name']).to eq 'Thai Palace'
         expect(restaurants.first['description']).to eq 'Lovely place.'
         expect(restaurants.first['city']).to eq 'Gothenburg'
         expect(restaurants.first['street-address']).to eq 'Holtermansgatan 1C'
         expect(restaurants.first['post-code']).to eq '410 29'
       end
    end
  end
end
