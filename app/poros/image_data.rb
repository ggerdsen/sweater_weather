class ImageData
  attr_reader :location,
              :image_url,
              :credit
  
  def initialize(data, search_params, author)
    @location = search_params
    @image_url = data
    @credit = {
                "source": "unsplash.com",
                "author": author,
                "logo": "https://unsplash-assets.imgix.net/marketing/press-logotype.svg?auto=format&fit=crop&q=60"
              }
    end
end