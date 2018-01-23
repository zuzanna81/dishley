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

      it 'includes specific restaurant' do
        get '/api/restaurants'
        json_resp = JSON.parse(response.body)['data'].first['attributes']
        expect(json_resp['name']).to eq 'Thai Palace'
        expect(json_resp['description']).to eq 'Lovely place.'
        expect(json_resp['city']).to eq 'Gothenburg'
        expect(json_resp['post-code']).to eq '410 29'
        expect(json_resp['restaurant-category']['name']).to eq 'Thai'
        expect(json_resp['street-address']).to eq 'Holtermansgatan 1C'
        expect(response.status).to eq 200
      end

    end

  end

end
