module ApplicationHelper
  def fake_location
    #binding.pry
   # {coords:{Rails.application.config.fake_location.to_json}}
   ({coords:Rails.application.config.fake_location.to_hash}).to_json

  end
end
