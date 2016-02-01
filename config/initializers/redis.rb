$redis = Redis.new

if Rails.env == 'production'
  rediscloud_service = JSON.parse(ENV['VCAP_SERVICES'])['p-redis']
  credentials = rediscloud_service.first['credentials']
  $redis = Redis.new(:host => credentials['host'], :port => credentials['port'], :password => credentials['password'])
end
