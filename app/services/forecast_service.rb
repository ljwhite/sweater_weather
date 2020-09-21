class ForecastService

  def self.find_forecast(location)
    uri = "/data/2.5/onecall"
    response = conn.get(uri) do |req|
      req.params['lat'] = location.lat
      req.params['lon'] = location.long
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
  url = 'https://api.openweathermap.org'
    @conn ||= Faraday.new(url: url) do |req|
      req.params['appid'] = ENV['OPEN_WEATHER_API']
      req.headers['Content-Type'] = 'application/json'
      req.headers['Accept'] = 'application/json'
    end
  end
end
