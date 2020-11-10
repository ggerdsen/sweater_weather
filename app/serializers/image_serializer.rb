class ImageSerializer
  include FastJsonapi::ObjectSerializer

    attributes :image
  # attribute :image do |object|
  #   {location: object.location,
  #    image_url: object.image_url,
  #    credit: object.credit}
  # end
end