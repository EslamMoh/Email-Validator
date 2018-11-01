class Rack::Attack
# `Rack::Attack` is configured to use the `Rails.cache` value by default,
  # but you can override that by setting the `Rack::Attack.cache.store` value
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # Allow all local traffic
  # whitelist('allow-localhost') do |req|
  #   '127.0.0.1' == req.ip || '::1' == req.ip
  # end
  throttle('req/ip', limit: 5, period: 1.seconds) do |req|
    req.ip if req.path == '/api/emails' && req.get? || req.path == '/emails' && req.post?
  end

  # Send the following response to throttled clients
  self.throttled_response = ->(env) {
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
      429,
      {'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s},
      [{error: "You reached the limit of retries , Retry again later"}.to_json]
    ]
  }

end