json.array! @hotels do |h|
  json.name h.name
  json.set! (t :description ), h.description
  json.average_price humanized_money_with_symbol(h.average_price)
  json.views_count h.views_count
  json.id h.id
  json.country_code h.country_code
  json.manager h.manager
end
