class ImageService

  def self.find_image(query)
  end

  private

  def self.conn
    url = 'https://api.unsplash.com/'
    @conn ||= Faraday.new(url: url) do |req|
      req.headers['Authorization'] = ENV['UNSPLASH']
    end
  end
end
