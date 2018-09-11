json.array! @hotels do |hotel|
  json.extract! hotel, :id, :name, :country_code, :description, :views_count, :manager
end
