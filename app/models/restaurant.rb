class Restaurant < ApplicationRecord
  validates :name, :description, :city, :post_code, :street_address, presence: true
  geocoded_by :full_address
  after_validation :geocode
  has_many :products
  belongs_to :restaurant_category

  def full_address
    Geocoder.address([self.street_address,
                      self.post_code,
                      self.city].join(','))
  end
end
