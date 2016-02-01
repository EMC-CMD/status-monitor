$bunny = Bunny.new

if Rails.env == 'production'
  service = JSON.parse(ENV['VCAP_SERVICES'])['p-rabbitmq']
  rabbit_uri = service.first['credentials']['protocols']['amqp']['uri']
  $bunny = Bunny.new(rabbit_uri)
end
