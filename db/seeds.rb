# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
hotel_ccs = ['it', 'gb', 'us', 'xx']
hotel_glob_descs =
  {
    'it' => "Per le vostre vacanze fatevi coccolare" ,
    'gb' => "You will experience terrific holidays" ,
    'us' => "Come and get treated properly during your vacations"
  }
plain_desc = "A boring description in a generic language translated in English"

users = Array.new(10) { FactoryBot.create(:user) }
50.times do
  cc = hotel_ccs.sample


  if cc =='xx'
    I18n.locale = :en
    FactoryBot.create(:hotel, description: plain_desc, manager: users.sample)
  else
    I18n.locale = :'it-IT'
    hotel = FactoryBot.create(:hotel, description: hotel_glob_descs['it'], country_code: cc, manager: users.sample)

    I18n.locale = :'en-UK'
    hotel.description = hotel_glob_descs['gb']
    hotel.save

    I18n.locale = :'en-US'
    hotel.description = hotel_glob_descs['us']
    hotel.save
  end

end
