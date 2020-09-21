class ImageFacade

  def self.find_image(location)
    image_data = ImageService.find_location_image(location)
    self.create_image_poro(image_data, location)
  end

  def self.create_image_poro(data, location)
    attrs = {
      location: location,
      url: data[:results][0][:urls][:regular],
      artist_name: data[:results][0][:user][:name],
      artist_portfolio: data[:results][0][:user][:portfolio_url]
    }
    Image.new(attrs)
  end
end
