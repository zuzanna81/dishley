require 'rails_helper'

RSpec.describe RestaurantCategory, type: :model do

  describe 'DB Table' do
    it { is_expected.to have_db_column :name}
    it { should have_many :restaurants }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name}
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(FactoryBot.create(:restaurant_category)).to be_valid
    end
  end
end
