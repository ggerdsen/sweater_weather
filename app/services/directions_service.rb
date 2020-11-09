class DirectionsService
  
  def self.get_distance(start, finish)
    conn = Faraday.new(url: "http://www.mapquestapi.com")
    response = conn.get("/directions/v2/route?key=#{ENV["MAPQUEST_SERVICE"]}&from=#{start[:lat]},#{start[:lng]}&to=#{finish[:lat]},#{finish[:lng]}")
    route = JSON.parse(response.body, symbolize_names: true)
    route[:route][:distance]
  end
  
end