class ForecastService
  
  def self.find_weather(lat, long)
    conn = Faraday.new(url: "https://api.openweathermap.org")
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{long}&exclude=minutely&appid=#{ENV["WEATHER_SERVICE"]}&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end
  
end