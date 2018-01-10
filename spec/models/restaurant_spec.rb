require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'Database' do
    it {is_expected.to have_db_column :name}
  end
end
