class DirectionsService
  
  def self.get_directions(start_city, end_city)
    conn = Faraday.new(url: "http://www.mapquestapi.com")
    response = conn.get("/directions/v2/route?key=#{ENV["MAPQUEST_SERVICE"]}&from=#{start_city}&to=#{end_city}")
    route = JSON.parse(response.body, symbolize_names: true)
    route[:route][:formattedTime]
  end
  
end