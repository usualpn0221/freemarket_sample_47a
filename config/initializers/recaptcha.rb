# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  # config.site_key   = Rails.application.secrets[:RECAPTCHA_SITE_KEY]
  # config.secret_key = Rails.application.secrets[:RECAPTCHA_PRIVATE_KEY]

  config.site_key   = ENV["RECAPTCHA_SITE_KEY"]
  config.secret_key = ENV["RECAPTCHA_SECRET_KEY"]

  # config.api_server_url = "v2"

  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end