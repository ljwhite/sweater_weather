class ForecastSerializer

  def self.forecast(forecast_object)
    {
    data:
      {
        type: 'forecast',
        attributes: {
          data: forecast_object.to_h
        }
      }
    }
  end
end
