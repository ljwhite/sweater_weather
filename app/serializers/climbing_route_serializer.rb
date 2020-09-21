class ClimbingRouteSerializer

  def summary(summary_object)
    {
      "data": {
        "type": "climbing route",
        "attributes": {
          "location": summary_object.location,
          "forecast": {
            "summary": summary_object.forecast_summary.summary,
            "temperature": summary_object.forecast_summary.temperature
          },
          summary_object.routes.each do |route|
          "routes":
            {
              "name": route.name,
              "type": route.type,
              "rating": route.rating,
              "location": route.location
              }
          "distance_to_route": summary_object.distance.find{|k,hash| key = route.name}.value
            ]
          end
        }
      }
    }
  end
end
