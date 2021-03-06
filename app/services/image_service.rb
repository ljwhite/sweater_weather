class ImageService

  def self.find_location_image(location)
    endpoint = '/search/photos'
    response = conn.get(endpoint) do |req|
      req.params['query'] = location #string interpolate query to include something more specific about the city (sky line, time of day, weather conditions, etc)
      req.params['per_page'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    url = "https://api.unsplash.com"
    @conn ||= Faraday.new(url: url) do |req|
      req.headers['Authorization'] = "Client-ID #{ENV['UNSPLASH_API_KEY']}"
      req.headers['Content-Type'] = 'application/json'
      req.headers['Accept'] = 'application/json'
    end
  end
end
