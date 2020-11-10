class BackgroundsService
  
  def self.get_background(location)
    @location = location
    conn = Faraday.new(url: "https://api.unsplash.com")
    response = conn.get("/search/photos?client_id=#{ENV["UNSPLASH_SERVICE"]}&query=#{location}")
    backgrounds = JSON.parse(response.body, symbolize_names: true)
  end
  
end