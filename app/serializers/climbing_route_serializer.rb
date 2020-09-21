class ClimbingRouteSerializer

  def self.summary(summary_object)
    {
      "data": {
        "type": "climbing route",
        "attributes": {
          "location": summary_object.location,
          "forecast": {
            "summary": summary_object.forecast_summary.summary,
            "temperature": summary_object.forecast_summary.temperature
          },
          "routes": summary_object.routes.each do |route| [
            {
              "name": route.name,
              "type": route.type,
              "rating": route.rating,
              "location": [route.location]
            },
          "distance_to_route": summary_object.route_distance.find{|k,v| k = route.name}.second.distance
            ]
          end
        }
      }
    }
  end
end
