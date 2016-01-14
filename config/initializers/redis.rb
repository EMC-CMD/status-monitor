$redis = Redis.new

if Rails.env == "production"
  rediscloud_service = JSON.parse(ENV['VCAP_SERVICES'])["rediscloud"]
  credentials = rediscloud_service.first["credentials"]
  $redis = Redis.new(:host => credentials["hostname"], :port => credentials["port"], :password => credentials["password"])
end
