class LocationService

  def self.find_coordinates(location)
    response = conn.get("/geocoding/v1/address") do |req|
      req.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_distance(origin, destination)
    response = conn.get("directions/v2/route") do |req|
      req.params['from'] = origin
      req.params['to'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    url = 'http://www.mapquestapi.com'
    @conn ||= Faraday.new(url: url) do |req|
      req.params['key'] = ENV["MAPQUEST_API_KEY"]
    end
  end
end
