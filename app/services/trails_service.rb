class TrailsService

  def self.find_trails(lat, long)
    conn = Faraday.new(url: "https://www.hikingproject.com")
    response = conn.get("/data/get-trails?lat=#{lat}&lon=#{long}&maxDistance=10&key=#{ENV["HIKING_SERVICE"]}")
    JSON.parse(response.body, symbolize_names: true)
  end

end