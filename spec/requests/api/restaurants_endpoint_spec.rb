require 'rails_helper'


RSpec.describe Api::RestaurantsController, type: :request do

  describe '#index' do
    context 'with anonymous doubles' do
      let!(:restaurants) do
        5.times {create(:restaurant)}
      end

      it 'returns a collection of restaurants' do
        get '/api/restaurants'
        expect(JSON.parse(response.body).count).to eq 5
      end
    end

    context 'with a specific restaurant' do
      let(:category) {create(:restaurant_category, name: 'Thai')}
      let!(:thai_food) {create(:restaurant,
                               name: 'Thai Palace',
                               description: 'Lovely place.',
                               street_address: 'Holtermasgatan 1C',
                               post_code: '410 29',
                               city: 'Gothenburg',
                               restaurant_category: category)}

      it 'includes specific restaurant' do
        get '/api/restaurants'
        expect(JSON.parse(response.body).first['name']).to eq 'Thai Palace'
      end


    end


  end


end