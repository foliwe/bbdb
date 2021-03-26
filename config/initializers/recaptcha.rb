Recaptcha.configure do |config|
    config.site_key = Rails.application.credentials.site_key
    config.secret_key = Rails.application.credentials.site_secret_key
  end