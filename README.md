# SweaterWeather

## About the Project

SweaterWeather is a backend application designed to allow users to find forecasts and plan a road trip.

The application is a RESTful API that receives requests and returns information accordingly. The information returned is pulled by consuming multiple third-party APIs. The application consumes the following APIs:
 - [MapQuest](https://developer.mapquest.com/documentation/) - to find a location coordinates and to show the distance between two locations.
 - [OpenWeather](https://openweathermap.org/api) - to find the forecast of a given location.
 - [Unsplash](https://unsplash.com/documentation) - to provide an image of a given location.

## Getting Started

### Prerequisites
Ruby version 2.5.3
Rails version 5.2.4.4

To user SweaterWeather locally, clone this repo and register for the required APIs. Add the api_key to the application.yml file.

### From the command line in your project directory:
```
bundle exec install
bundle exec figaro install   
```
Note that this will create a application.yml file.
```
rails db:create
rails db:migrate
```
This will create a user model to the database. The user attributes are a primary key, email address, encrypted password, and api_key.

Run the local server to be able to accept API requests.   

### Run Test Suites
To run the current test suite, run the following from the command line in your project directory.
```
bundle exec rspec
```

## Endpoints

### Weather Forecast
Retrieve a Weather Forecast for a City. If you hit the /forecast endpoint, you'll retrieve the forecast for the provided location. Note that the location must be provided in a specific format. See below example for more information. Forecast details are provided for the current conditions, for the next several hours, and the next five days. The forecast is provided through the OpenWeather API.
- Verb: Get
- Endpoint: ```/api/v1/forecast```
- Params: ```{ location: city,st }```
- Example: 'denver,co', 'miami,fl'
- Example Response:

```
{
  "data": [
      {
          "type": "forecast",
          "attributes": {
              "data": {
                  "current_forecast": {
                      "current_temp": 58,
                      "feels_like": 55,
                      "humidity": 13,
                      "uv_index": 7.24,
                      "current_description": "Few Clouds",
                      "sunrise": 1600865338,
                      "sunset": 1600908912,
                      "time": "2020-09-23T17:59:22.000-06:00",
                      "high": 59,
                      "low": 51
                  },
                  "hourly_forecast": {
                      "hour_0": {
                          "temp": 58,
                          "description": "Clouds",
                          "time": "5 PM"
                      },
                      "hour_1": {
                          "temp": 59,
                          "description": "Clouds",
                          "time": "6 PM"
                      },
                      //...other hour fields
                  },
                  "daily_forecast": {
                      "day_1": {
                          "day": "Thursday",
                          "high": 62,
                          "low": 51,
                          "description": "Clouds",
                          "rainfall": null,
                          "snowfall": null
                      },
                      //...other daily forecasts
                  }
              }
          }
      }
  ]
}
```

### Image Forecast
Retrieve a background image to use when displaying the forecast for a city. If you hit the /backgrounds endpoint, you'll retrieve the link to a random image for the provided location. The photo is provided through the Unsplash API.
  - Verb: Get
  - Endpoint: ```/api/v1/backgrounds```
  - Params:  ``` { location: city,st } ```
  - Example: 'denver,co', 'miami,fl'
  - Example Response:

```
{
    "data": {
        "id": null,
        "type": "background",
        "attributes": {
            "location": "denver,co",
            "url": "https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE2Nzg1OX0",
            "credits": {
                "artist_name": "Joshua Forbes",
                "artist_portfolio": "https://www.joshuaforbes.co.za"
            }
        }
    }
}
```

### User Registration
To take advantage of the of the road trip endpoint, the user must be registered. An email address, password, and password confirmation are needed for registration and are to be provided in the body of the request. The user will be provided with an api_key for upon successful registration.
- Verb: Post
- Endpoint: ```/api/v1/users```
- Body:

```
{
  "email": "email_address",
  "password": "password",
  "password_confirmation": "password"
}
```

- Example Response:

```
{
"data": {
    "id": "158",
    "type": "user",
    "attributes": {
        "email": "email",
        "api_key": "4e16693d-6e0b-4ffc-922a-87fdf40ee7fa"
    }
}
}
```

### User Login
After registering on the application, a user can log back in to the site. The user will provide email address and password in the body of the request.
- Verb: Post
- Endpoint: ```/api/v1/sessions```
- Body:

```
{
  "email": "email_address",
  "password": "password"
}
```

- Example Response:

```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "email",
      "api_key": "4e16693d-6e0b-4ffc-922a-87fdf40ee7fa"
    }
  }
}
```

### Road Trip
A user can find road trip information given two locations. The forecast will also be provided for the destination. The user must provide the locations of the origin and destination, as well as the user's api_key for validation.
- Verb: Post
- Endpoint: ```/api/v1/road_trip```
- Body:
```
 {
   "origin": "city,st",
   "destination": city,"st",
   "api_key": "api_key"
  }
```
- Example Response:
```
{
    "data": {
        "id": null,
        "type": "road_trip",
        "attributes": {
            "origin": "\"denver, CO\"",
            "destination": "\"pueblo, CO\"",
            "time": "1 hour, 44 minutes",
            "temperature": 58,
            "description": "Clear Sky"
        }
    }
}
```
