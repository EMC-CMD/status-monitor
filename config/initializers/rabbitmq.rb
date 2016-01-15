$bunny = Bunny.new

if Rails.env == 'production'
  service = JSON.parse(ENV['VCAP_SERVICES'])["cloudamqp"]
  rabbit_uri = service.first["credentials"]["uri"]
  $bunny = Bunny.new(rabbit_uri)
end
