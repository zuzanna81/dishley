Geocoder.configure(
  timeout: 5,
  lookup: :google,
  api_key: ENV['GEOCODER_APIKEY'],
  units: :km
)
