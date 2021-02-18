if Rails.env.test?
  REDIS = MockRedis.new
else
  REDIS = Redis.new(url: Settings.redis.url)
end
