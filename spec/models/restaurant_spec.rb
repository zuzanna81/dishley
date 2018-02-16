require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :city }
    it { is_expected.to have_db_column :post_code }
    it { is_expected.to have_db_column :street_address }
    it { is_expected.to have_db_column :longitude }
    it { is_expected.to have_db_column :latitude }
    it { is_expected.to belong_to :restaurant_category }
    it { is_expected.to have_many :products }
    it { is_expected.to have_many :product_categories }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :post_code }
    it { is_expected.to validate_presence_of :street_address }
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(create(:restaurant)).to be_valid
    end
  end

  describe '#full_address' do
    subject do
      create(:restaurant, street_address: 'Båtsmansdalsgatan 7',
                          city: 'Gothenburg',
                          post_code: '424 30')
    end

    it 'sets the full_address using geocoder' do
      expect(subject.full_address).to eq 'Båtsmansdalsgatan 7, 424 32 Angered, Sweden'
    end
  end

  describe '#category_name' do
    let(:restaurant_category) { create :restaurant_category, name: 'Chinese' }
    let(:restaurant) do
      create :restaurant, name: 'Zuzannas Pizza 2',
                          restaurant_category: restaurant_category
    end

    it 'sets the restaurant_category field' do
      expect(restaurant.category_name).to eq 'Chinese'
    end
  end
end
