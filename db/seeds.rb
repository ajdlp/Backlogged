require 'httparty'

@nes = HTTParty.get("https://www.kimonolabs.com/api/8g4e6ylc?apikey=b25MqRZiGNLAUELhKxzrHnttW4ZsbwPZ")

@nesgames = @nes["results"]["collection1"]

@nesgames.each do |game|
  Game.create(title: game["property1"]["text"], boxart: game["property2"]["src"], platform: game["property3"]["text"], release_year: game["property4"] )
end
