# frozen_string_literal: true

# Responsible for allowing automatic cache expiration after a day.
# This could be extended as needed.
class AutoexpireCacheRedis
  def initialize(store, ttl = 86400)
    @store = store
    @ttl = ttl
  end

  def [](url)
    @store.get(url)
  end

  def []=(url, value)
    @store.set(url, value)
    @store.expire(url, @ttl)
  end

  def keys
    @store.keys
  end

  def del(url)
    @store.del(url)
  end
end

redis_cache = AutoexpireCacheRedis.new(Redis.new(url: ENV.fetch('REDIS_CACHE_URL', nil)))

# Geocoding options
# timeout: 3,                 # geocoding service timeout (secs)
# lookup: :nominatim,         # name of geocoding service (symbol)
# ip_lookup: :ipinfo_io,      # name of IP address geocoding service (symbol)
# language: :en,              # ISO-639 language code
# use_https: false,           # use HTTPS for lookup requests? (if supported)
# http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
# https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
# api_key: nil,               # API key for geocoding service
# cache: nil,                 # cache object (must respond to #[], #[]=, and #del)

# Exceptions that should not be rescued by default
# (if you want to implement custom error handling);
# supports SocketError and Timeout::Error
# always_raise: [],

# Calculation options
# units: :mi,                 # :km for kilometers or :mi for miles
# distances: :linear          # :spherical or :linear

# Cache configuration
# cache_options: {
#   expiration: 2.days,
#   prefix: 'geocoder:'
# }

geocoder_configurations = {
  'development' => {
    use_https: true,
    api_key: ENV.fetch('GOOGLE_GEOCODING_KEY', nil),
    cache: redis_cache,
    cache_prefix: 'geocoder',
    lookup: :google
  },
  'production'  => {
    timeout: 5,
    use_https: true,
    api_key: ENV.fetch('GOOGLE_GEOCODING_KEY', nil),
    cache: redis_cache,
    cache_prefix: 'geocoder',
    lookup: :google
  },
  'test'        => {
    lookup: :test
  }
}

Geocoder.configure(geocoder_configurations[Rails.env])
