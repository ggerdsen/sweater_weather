class BackgroundData
  
  attr_reader :type,
              :id,
              :image
  
  def initialize(data, search_params)
    @type = "image"
    @id = "null"
    @image = ImageData.new(data[:results].first[:urls][:raw], search_params, data[:results].first[:user][:username])
  end
end