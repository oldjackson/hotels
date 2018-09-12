json.array! @hotels do |h|
  json.Name h.name
  json.Description h.description
  json.Average_price humanized_money_with_symbol(h.average_price)
  json.View_count h.views_count
  json.id h.id
  json.country_code h.country_code
  json.manager h.manager
end
