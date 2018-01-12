class Restaurant < ApplicationRecord
  validates :name, :description, :city, :post_code, :street_address, presence: true
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    Geocoder.address([self.street_address,
                      self.post_code,
                      self.city].join(','))
  end
end
