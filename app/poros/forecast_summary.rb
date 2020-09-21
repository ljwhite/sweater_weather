class ForecastSummary

  def initialize(attrs)
    @summary = attrs[:current_forecast][:current_description]
    @temperature = attrs[:current_forecast][:current_temp]
  end
end
