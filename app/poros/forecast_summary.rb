class ForecastSummary
  attr_reader :summary, :temperature
  def initialize(attrs)
    @summary = attrs[:current_forecast][:current_description]
    @temperature = attrs[:current_forecast][:current_temp]
  end
end
