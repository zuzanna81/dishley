require 'webmock/cucumber'
WebMock.disable_net_connect!(allow_localhost: true)

Before('@googlemap') do
  fixtures_path = "#{::Rails.root}/features/support/fixtures"

  goteborg = File.open("#{fixtures_path}/goteborg.txt").read
  goteborg_1 = File.open("#{fixtures_path}/goteborg_1.txt").read
  goteborg_2 = File.open("#{fixtures_path}/goteborg_2.txt").read
  stockholm = File.open("#{fixtures_path}/stockholm.txt").read
  stockholm_1 = File.open("#{fixtures_path}/stockholm_1.txt").read

  stub_request(:get, 'https://maps.googleapis.com/maps/api/geocode/json?address=Drottninggatan%201,%20411%2014%20G%C3%B6teborg,%20Sweden&key=AIzaSyDW9dLu18GJQ7iv-kyvjjZUevgHRQQtx2E&language=en&sensor=false')
    .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
    .to_return(status: 200, body: goteborg, headers: {})

  stub_request(:get, 'https://maps.googleapis.com/maps/api/geocode/json?address=Drottninggatan%201,410%2000,G%C3%B6teborg&key=AIzaSyDW9dLu18GJQ7iv-kyvjjZUevgHRQQtx2E&language=en&sensor=false')
    .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
    .to_return(status: 200, body: goteborg, headers: {})

  stub_request(:get, 'https://maps.googleapis.com/maps/api/geocode/json?address=Kungsgatan%201,410%2000,G%C3%B6teborg&key=AIzaSyDW9dLu18GJQ7iv-kyvjjZUevgHRQQtx2E&language=en&sensor=false')
    .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
    .to_return(status: 200, body: goteborg_1, headers: {})

  stub_request(:get, 'https://maps.googleapis.com/maps/api/geocode/json?address=Kungsgatan%201,%20411%2019%20G%C3%B6teborg,%20Sweden&key=AIzaSyDW9dLu18GJQ7iv-kyvjjZUevgHRQQtx2E&language=en&sensor=false')
    .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
    .to_return(status: 200, body: goteborg_1, headers: {})

  stub_request(:get, 'https://maps.googleapis.com/maps/api/geocode/json?address=%C3%96stra%20Hmangatan%201,410%2000,G%C3%B6teborg&key=AIzaSyDW9dLu18GJQ7iv-kyvjjZUevgHRQQtx2E&language=en&sensor=false')
    .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
    .to_return(status: 200, body: goteborg_2, headers: {})

  stub_request(:get, 'https://maps.googleapis.com/maps/api/geocode/json?address=%C3%96stra%20Hamngatan%201,%20411%2010%20G%C3%B6teborg,%20Sweden&key=AIzaSyDW9dLu18GJQ7iv-kyvjjZUevgHRQQtx2E&language=en&sensor=false')
    .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
    .to_return(status: 200, body: goteborg_2, headers: {})

  stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Brinellv%C3%A4gen%208,410%2000,Stockholm&key=AIzaSyDW9dLu18GJQ7iv-kyvjjZUevgHRQQtx2E&language=en&sensor=false")
    .with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'})
    .to_return(status: 200, body: stockholm, headers: {})

  stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Centralplan%2015,410%2000,Stockholm&key=AIzaSyDW9dLu18GJQ7iv-kyvjjZUevgHRQQtx2E&language=en&sensor=false")
    .with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'})
    .to_return(status: 200, body: stockholm_1, headers: {})
end
