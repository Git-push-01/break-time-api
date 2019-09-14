require 'lograge/sql/extension'

Rails.application.configure do
    # Lograge config
    config.lograge.enabled = true
    config.lograge.formatter = Lograge::Formatters::Json.new
    config.colorize_logging = false

    config.lograge.custom_options = lambda do |event|
      { :params => event.payload[:params] }
  end
end
