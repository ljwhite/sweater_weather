class Forecast

  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def call
    prepare_response
  end

  private

  def prepare_response
    hash = [current_forecast, hourly_forecast, daily_forecast].reduce(&:merge)
    OpenStruct.new(hash)
  end

  def current
    attributes.fetch(:current)
  end

  def current_forecast
    {current_forecast:
    {
      current_temp: convert_temperature(current[:temp]),
      feels_like: convert_temperature(current[:feels_like]),
      humidity: current[:humidity],
      uv_index: current[:uvi],
      current_description: current[:weather][0][:description].split.map(&:capitalize)*' ',
      sunrise: current[:sunrise],
      sunset: current[:sunset],
      time: Time.at(current[:dt]),
      high: convert_temperature(daily[0][:temp][:max]),
      low: convert_temperature(daily[0][:temp][:min])
    }}
  end

  def hourly
    attributes.fetch(:hourly)
  end

  def hourly_forecast
    hourly_forecasts = Hash.new
    (0..7).to_a.map do |hour|
      hourly_forecasts["hour_#{hour}"] =
        {
        "temp".to_sym => convert_temperature(hourly[hour][:temp]),
        "description".to_sym => hourly[hour][:weather][0][:main],
        "time".to_sym => find_hour(Time.at(current[:dt]).strftime('%-H').to_i + hour)
        }
    end
    {
      hourly_forecast: hourly_forecasts
    }

  end

  def daily
    attributes.fetch(:daily)
  end

  def daily_forecast
    daily_forecasts = Hash.new
    (1..5).to_a.map do |day|
      daily_forecasts["day_#{day}".to_sym] =
        {
          day: Time.at(current[:dt] + day.day).strftime('%-A'),
          "high".to_sym => convert_temperature(daily[day][:temp][:max]),
          "low".to_sym => convert_temperature(daily[day][:temp][:min]),
          "description".to_sym => daily[day][:weather][0][:main],
          "rainfall".to_sym => daily[day][:rain],
          "snowfall".to_sym => daily[day][:snow]
        }
    end
    {
      daily_forecast: daily_forecasts
    }
  end

  def convert_temperature(kelvin)
    (kelvin - 273.15 * (9/5) + 32).to_i
  end

  def find_hour(hour)
    if hour > 24
      "#{hour - 24} AM"
    elsif hour > 12
       "#{hour - 12} PM"
    else
       "#{hour} AM"
    end
  end
end
