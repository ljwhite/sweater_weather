class Image

  attr_reader :location, :url, :credits, :id

  def initialize(attrs)
    @location = attrs[:location]
    @url = attrs[:url]
    @artist_name = attrs[:artist_name]
    @artist_portfolio = attrs[:artist_portfolio]
    @id = nil
    @credits = format_image_credit(@artist_name, @artist_portfolio)
  end

  def format_image_credit(name, portfolio)
    {artist_name: name, artist_portfolio: portfolio}
  end
end
