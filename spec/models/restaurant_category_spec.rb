require 'rails_helper'

RSpec.describe RestaurantCategory, type: :model do
  it { is_expected.to have_db_column :name}
end
