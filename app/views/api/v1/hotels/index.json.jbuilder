json.array! @hotels do |h|
  json.name h.name
  json.description h.description
  begin
    json.average_price humanized_money_with_symbol(h.average_price.exchange_to(t('currency')))
  rescue Money::Bank::UnknownRate
    json.average_price humanized_money_with_symbol(h.average_price)
  end
  json.views_count h.views_count
  json.id h.id
  json.country_code h.country_code
  json.manager h.manager
end
