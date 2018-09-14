Globalize.fallbacks = {
  :en => [:en, :"en-UK", :"en-US", :"it-IT"],
  :"en-UK" => [:"en-UK", :en, :"en-US", :"it-IT"],
  :"en-US" => [:"en-US", :en, :"en-UK", :"it-IT"],
  :"it-IT" => [:"it-IT", :en, :"en-US", :"en-UK"]
}
