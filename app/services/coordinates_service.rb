class CoordinatesService
  
  def self.get_lat_long(location)
    @location = location
    conn = Faraday.new(url: "https://www.mapquestapi.com")
    response = conn.get("/geocoding/v1/address?key=#{ENV["MAPQUEST_SERVICE"]}&inFormat=kvp&outFormat=json&location=#{@location}&thumbMaps=false")
    JSON.parse(response.body, symbolize_names: true)
  end
  
end