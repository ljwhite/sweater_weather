class ImageService

  def self.find_location_image(location)
    endpoint = '/search/photos'
    response = conn.get(endpoint) do |req|
      req.params['query'] = location
      req.params['per_page'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    url = "https://api.unsplash.com"
    @conn ||= Faraday.new(url: url) do |req|
      req.headers['Authorization'] = "Client-ID #{ENV['UNSPLASH_API_KEY']}"
    end
  end
end
