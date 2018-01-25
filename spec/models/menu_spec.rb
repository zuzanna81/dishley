require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_many :product_categories }
    it { is_expected.to belong_to :restaurant }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(create(:menu)).to be_valid
    end
  end
end
