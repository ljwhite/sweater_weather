class RouteService

  def self.find_routes(location)
    response = conn.get('/data/get-routes-for-lat-lon') do |req|
      req.params['lat'] = location.lat
      req.params['lon'] = location.long
      req.params['maxResults'] = 5
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    url = 'https://www.mountainproject.com'
    @conn ||= Faraday.new(url: url) do |req|
      req.params['key'] = ENV['MOUNTAIN_PROJECT_API_KEY']
    end
  end
end
