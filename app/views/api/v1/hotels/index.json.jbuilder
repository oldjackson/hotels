json.array! @hotels do |h|
  present(h) do |h_pres|
    json.name h_pres.name
    json.description h_pres.description
    json.average_price h_pres.average_price
    json.views_count h_pres.views_count
    json.id h_pres.id
    json.country_code h_pres.country_code
    json.manager h_pres.manager
  end
end
