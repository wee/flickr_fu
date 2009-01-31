class Flickr::Photos::Geo < Flickr::Base

  def initialize(flickr)
    @flickr = flickr
  end

  # Get the geo data (latitude and longitude and the accuracy level) for a photo.
  #
  # Params
  # * photo_id (Required)
  #
  # Returns Flickr::Photos::Location object containing photo location
  # or nil if photo is not geotagged.
  def get_location(photo_id)
    # begin
    rsp = @flickr.send_request('flickr.photos.geo.getLocation', {:photo_id => photo_id})
    Flickr::Photos::Location.new(:latitude => rsp.photo.location[:latitude].to_f,
      :longitude => rsp.photo.location[:longitude].to_f, :accuracy => rsp.photo.location[:accuracy].to_i)
  end
end