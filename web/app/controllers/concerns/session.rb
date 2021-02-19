module Session
  def self.create(user)
    token = SecureRandom.hex(64)
    REDIS.mapped_hmset(
      token,
      'user_id' => user.id,
    )
    REDIS.expire(token, Settings.redis.timeout)
    return token
  end

  def self.get(token)
    REDIS.hgetall(token)
  end
end
