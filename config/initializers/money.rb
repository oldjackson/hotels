MoneyRails.configure do |config|
  config.default_currency = :eur

  # Set exchange rates
  config.add_rate "EUR", "USD", 1.16932
  config.add_rate "USD", "EUR", 0.85511
  config.add_rate "GBP", "EUR", 1.12124
  config.add_rate "EUR", "GBP", 0.89198
  config.add_rate "GBP", "USD", 1.31134
  config.add_rate "USD", "GBP", 0.76258

end
