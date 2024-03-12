//
//  WeathrModel.swift
//  WetherTask
//
//  Created by Mohamed Elboraey on 12/02/2024.
//

import Foundation

struct WeatherResponse: Codable, Hashable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
    
    func hash(into hasher: inout Hasher) {
        // Combine hash values of properties that determine uniqueness
        hasher.combine(location)
        hasher.combine(current)
        hasher.combine(forecast)
    }
    
    // Implement == operator for equality comparison
    static func == (lhs: WeatherResponse, rhs: WeatherResponse) -> Bool {
        // Compare properties for equality
        return lhs.location == rhs.location &&
            lhs.current == rhs.current &&
            lhs.forecast == rhs.forecast
    }
}

struct Location: Codable, Hashable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime_epoch: Int
    let localtime: String
}

struct Current: Codable, Hashable {
    static func == (lhs: Current, rhs: Current) -> Bool {
        return lhs.last_updated_epoch == rhs.last_updated_epoch
        return lhs.last_updated == rhs.last_updated
        return lhs.temp_c == rhs.temp_c
        return lhs.temp_f == rhs.temp_f
        return lhs.is_day == rhs.is_day
        return lhs.condition == rhs.condition
        return lhs.wind_mph == rhs.wind_mph
        return lhs.wind_kph == rhs.wind_kph
        return lhs.wind_degree == rhs.wind_degree
        return lhs.wind_dir == rhs.wind_dir
        return lhs.pressure_mb == rhs.pressure_mb
        return lhs.pressure_in == rhs.pressure_in
        return lhs.humidity == rhs.humidity
        return lhs.cloud == rhs.cloud
        return lhs.feelslike_c == rhs.feelslike_c
        return lhs.feelslike_f == rhs.feelslike_f
        return lhs.vis_km == rhs.vis_km
        return lhs.vis_miles == rhs.vis_miles
        return lhs.uv == rhs.uv
        return lhs.gust_mph == rhs.gust_mph
        return lhs.gust_kph == rhs.gust_kph
    }
    
    let last_updated_epoch: Int
    let last_updated: String
    let temp_c: Double
    let temp_f: Double
    let is_day: Int
    let condition: Condition
    let wind_mph: Double
    let wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    let precip_mm: Double
    let precip_in: Double
    let humidity: Int
    let cloud: Int
    let feelslike_c: Double
    let feelslike_f: Double
    let vis_km: Double
    let vis_miles: Double
    let uv: Double
    let gust_mph: Double
    let gust_kph: Double
}

struct Condition: Codable, Hashable {
    let text: String
    let icon: String
    let code: Int
}

struct Forecast: Codable, Hashable, Equatable {
    let forecastday: [ForecastDay]
        // Implement == operator for equality comparison
        static func == (lhs: Forecast, rhs: Forecast) -> Bool {
            // Compare properties for equality
            return lhs.forecastday == rhs.forecastday
        }
}

struct ForecastDay: Codable, Hashable {
    static func == (lhs: ForecastDay, rhs: ForecastDay) -> Bool {
        return lhs.date == rhs.date
        return lhs.date_epoch == rhs.date_epoch
        return lhs.day == rhs.day
        return lhs.astro == rhs.astro
        return lhs.hour == rhs.hour
    }
    
    let date: String
    let date_epoch: Int
    let day: Day
    let astro: Astro
    let hour: [Hour]
}

struct Day: Codable, Hashable {
    let maxtemp_c: Double
    let maxtemp_f: Double
    let mintemp_c: Double
    let mintemp_f: Double
    let avgtemp_c: Double
    let avgtemp_f: Double
    // Add other properties as needed
}

struct Astro: Codable, Hashable {
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
    let moon_phase: String
    let moon_illumination: Int
    let is_moon_up: Int
    let is_sun_up: Int
}

struct Hour: Codable, Hashable {
    let time_epoch: Int
    let time: String
    let temp_c: Double
    let temp_f: Double
    // Add other properties as needed
}


/*
 {
     "location": {
         "name": "London",
         "region": "City of London, Greater London",
         "country": "United Kingdom",
         "lat": 51.52,
         "lon": -0.11,
         "tz_id": "Europe/London",
         "localtime_epoch": 1707707619,
         "localtime": "2024-02-12 3:13"
     },
     "current": {
         "last_updated_epoch": 1707706800,
         "last_updated": "2024-02-12 03:00",
         "temp_c": 4.0,
         "temp_f": 39.2,
         "is_day": 0,
         "condition": {
             "text": "Clear",
             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
             "code": 1000
         },
         "wind_mph": 5.6,
         "wind_kph": 9.0,
         "wind_degree": 230,
         "wind_dir": "SW",
         "pressure_mb": 999.0,
         "pressure_in": 29.5,
         "precip_mm": 0.0,
         "precip_in": 0.0,
         "humidity": 93,
         "cloud": 0,
         "feelslike_c": 1.6,
         "feelslike_f": 34.9,
         "vis_km": 10.0,
         "vis_miles": 6.0,
         "uv": 1.0,
         "gust_mph": 8.9,
         "gust_kph": 14.3
     },
     "forecast": {
         "forecastday": [
             {
                 "date": "2024-02-12",
                 "date_epoch": 1707696000,
                 "day": {
                     "maxtemp_c": 9.1,
                     "maxtemp_f": 48.4,
                     "mintemp_c": 4.4,
                     "mintemp_f": 40.0,
                     "avgtemp_c": 6.4,
                     "avgtemp_f": 43.6,
                     "maxwind_mph": 10.5,
                     "maxwind_kph": 16.9,
                     "totalprecip_mm": 0.01,
                     "totalprecip_in": 0.0,
                     "totalsnow_cm": 0.0,
                     "avgvis_km": 10.0,
                     "avgvis_miles": 6.0,
                     "avghumidity": 71,
                     "daily_will_it_rain": 0,
                     "daily_chance_of_rain": 0,
                     "daily_will_it_snow": 0,
                     "daily_chance_of_snow": 0,
                     "condition": {
                         "text": "Sunny",
                         "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                         "code": 1000
                     },
                     "uv": 1.0
                 },
                 "astro": {
                     "sunrise": "07:21 AM",
                     "sunset": "05:09 PM",
                     "moonrise": "08:39 AM",
                     "moonset": "08:52 PM",
                     "moon_phase": "Waxing Crescent",
                     "moon_illumination": 6,
                     "is_moon_up": 0,
                     "is_sun_up": 0
                 },
                 "hour": [
                     {
                         "time_epoch": 1707696000,
                         "time": "2024-02-12 00:00",
                         "temp_c": 5.6,
                         "temp_f": 42.0,
                         "is_day": 0,
                         "condition": {
                             "text": "Partly Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                             "code": 1003
                         },
                         "wind_mph": 6.0,
                         "wind_kph": 9.7,
                         "wind_degree": 253,
                         "wind_dir": "WSW",
                         "pressure_mb": 999.0,
                         "pressure_in": 29.49,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 87,
                         "cloud": 36,
                         "feelslike_c": 3.4,
                         "feelslike_f": 38.1,
                         "windchill_c": 3.4,
                         "windchill_f": 38.1,
                         "heatindex_c": 5.6,
                         "heatindex_f": 42.0,
                         "dewpoint_c": 3.6,
                         "dewpoint_f": 38.4,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 9.0,
                         "gust_kph": 14.5,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707699600,
                         "time": "2024-02-12 01:00",
                         "temp_c": 5.3,
                         "temp_f": 41.6,
                         "is_day": 0,
                         "condition": {
                             "text": "Partly Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                             "code": 1003
                         },
                         "wind_mph": 5.8,
                         "wind_kph": 9.4,
                         "wind_degree": 246,
                         "wind_dir": "WSW",
                         "pressure_mb": 999.0,
                         "pressure_in": 29.5,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 88,
                         "cloud": 39,
                         "feelslike_c": 3.2,
                         "feelslike_f": 37.7,
                         "windchill_c": 3.2,
                         "windchill_f": 37.7,
                         "heatindex_c": 5.3,
                         "heatindex_f": 41.6,
                         "dewpoint_c": 3.5,
                         "dewpoint_f": 38.2,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 8.8,
                         "gust_kph": 14.2,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707703200,
                         "time": "2024-02-12 02:00",
                         "temp_c": 5.3,
                         "temp_f": 41.5,
                         "is_day": 0,
                         "condition": {
                             "text": "Partly Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                             "code": 1003
                         },
                         "wind_mph": 6.0,
                         "wind_kph": 9.7,
                         "wind_degree": 243,
                         "wind_dir": "WSW",
                         "pressure_mb": 1000.0,
                         "pressure_in": 29.52,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 88,
                         "cloud": 29,
                         "feelslike_c": 3.0,
                         "feelslike_f": 37.4,
                         "windchill_c": 3.0,
                         "windchill_f": 37.4,
                         "heatindex_c": 5.3,
                         "heatindex_f": 41.5,
                         "dewpoint_c": 3.4,
                         "dewpoint_f": 38.1,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 9.1,
                         "gust_kph": 14.7,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707706800,
                         "time": "2024-02-12 03:00",
                         "temp_c": 4.0,
                         "temp_f": 39.2,
                         "is_day": 0,
                         "condition": {
                             "text": "Clear",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
                             "code": 1000
                         },
                         "wind_mph": 5.6,
                         "wind_kph": 9.0,
                         "wind_degree": 230,
                         "wind_dir": "SW",
                         "pressure_mb": 999.0,
                         "pressure_in": 29.5,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 93,
                         "cloud": 0,
                         "feelslike_c": 3.0,
                         "feelslike_f": 37.5,
                         "windchill_c": 3.0,
                         "windchill_f": 37.5,
                         "heatindex_c": 5.2,
                         "heatindex_f": 41.3,
                         "dewpoint_c": 3.2,
                         "dewpoint_f": 37.7,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 8.9,
                         "gust_kph": 14.3,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707710400,
                         "time": "2024-02-12 04:00",
                         "temp_c": 4.9,
                         "temp_f": 40.9,
                         "is_day": 0,
                         "condition": {
                             "text": "Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/119.png",
                             "code": 1006
                         },
                         "wind_mph": 5.4,
                         "wind_kph": 8.6,
                         "wind_degree": 238,
                         "wind_dir": "WSW",
                         "pressure_mb": 1000.0,
                         "pressure_in": 29.54,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 87,
                         "cloud": 74,
                         "feelslike_c": 2.9,
                         "feelslike_f": 37.2,
                         "windchill_c": 2.9,
                         "windchill_f": 37.2,
                         "heatindex_c": 4.9,
                         "heatindex_f": 40.9,
                         "dewpoint_c": 3.0,
                         "dewpoint_f": 37.3,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 8.5,
                         "gust_kph": 13.6,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707714000,
                         "time": "2024-02-12 05:00",
                         "temp_c": 4.7,
                         "temp_f": 40.5,
                         "is_day": 0,
                         "condition": {
                             "text": "Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/119.png",
                             "code": 1006
                         },
                         "wind_mph": 4.9,
                         "wind_kph": 7.9,
                         "wind_degree": 235,
                         "wind_dir": "SW",
                         "pressure_mb": 1001.0,
                         "pressure_in": 29.55,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 87,
                         "cloud": 64,
                         "feelslike_c": 2.8,
                         "feelslike_f": 37.1,
                         "windchill_c": 2.8,
                         "windchill_f": 37.1,
                         "heatindex_c": 4.7,
                         "heatindex_f": 40.5,
                         "dewpoint_c": 2.8,
                         "dewpoint_f": 37.0,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 7.9,
                         "gust_kph": 12.8,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707717600,
                         "time": "2024-02-12 06:00",
                         "temp_c": 4.6,
                         "temp_f": 40.2,
                         "is_day": 0,
                         "condition": {
                             "text": "Patchy rain nearby",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
                             "code": 1063
                         },
                         "wind_mph": 5.6,
                         "wind_kph": 9.0,
                         "wind_degree": 238,
                         "wind_dir": "WSW",
                         "pressure_mb": 1001.0,
                         "pressure_in": 29.56,
                         "precip_mm": 0.01,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 87,
                         "cloud": 58,
                         "feelslike_c": 2.4,
                         "feelslike_f": 36.2,
                         "windchill_c": 2.4,
                         "windchill_f": 36.2,
                         "heatindex_c": 4.6,
                         "heatindex_f": 40.2,
                         "dewpoint_c": 2.5,
                         "dewpoint_f": 36.6,
                         "will_it_rain": 1,
                         "chance_of_rain": 80,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 9.1,
                         "gust_kph": 14.7,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707721200,
                         "time": "2024-02-12 07:00",
                         "temp_c": 4.4,
                         "temp_f": 40.0,
                         "is_day": 0,
                         "condition": {
                             "text": "Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/119.png",
                             "code": 1006
                         },
                         "wind_mph": 6.0,
                         "wind_kph": 9.7,
                         "wind_degree": 245,
                         "wind_dir": "WSW",
                         "pressure_mb": 1002.0,
                         "pressure_in": 29.58,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 86,
                         "cloud": 68,
                         "feelslike_c": 2.0,
                         "feelslike_f": 35.7,
                         "windchill_c": 2.0,
                         "windchill_f": 35.7,
                         "heatindex_c": 4.4,
                         "heatindex_f": 40.0,
                         "dewpoint_c": 2.3,
                         "dewpoint_f": 36.1,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 9.7,
                         "gust_kph": 15.6,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707724800,
                         "time": "2024-02-12 08:00",
                         "temp_c": 4.5,
                         "temp_f": 40.1,
                         "is_day": 1,
                         "condition": {
                             "text": "Partly Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                             "code": 1003
                         },
                         "wind_mph": 5.1,
                         "wind_kph": 8.3,
                         "wind_degree": 253,
                         "wind_dir": "WSW",
                         "pressure_mb": 1003.0,
                         "pressure_in": 29.62,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 85,
                         "cloud": 47,
                         "feelslike_c": 2.5,
                         "feelslike_f": 36.4,
                         "windchill_c": 2.5,
                         "windchill_f": 36.4,
                         "heatindex_c": 4.5,
                         "heatindex_f": 40.1,
                         "dewpoint_c": 2.2,
                         "dewpoint_f": 35.9,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 8.0,
                         "gust_kph": 12.9,
                         "uv": 2.0,
                         "short_rad": 4.74,
                         "diff_rad": 2.14
                     },
                     {
                         "time_epoch": 1707728400,
                         "time": "2024-02-12 09:00",
                         "temp_c": 5.3,
                         "temp_f": 41.5,
                         "is_day": 1,
                         "condition": {
                             "text": "Sunny",
                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                             "code": 1000
                         },
                         "wind_mph": 5.4,
                         "wind_kph": 8.6,
                         "wind_degree": 253,
                         "wind_dir": "WSW",
                         "pressure_mb": 1004.0,
                         "pressure_in": 29.64,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 80,
                         "cloud": 24,
                         "feelslike_c": 3.3,
                         "feelslike_f": 37.9,
                         "windchill_c": 3.3,
                         "windchill_f": 37.9,
                         "heatindex_c": 5.3,
                         "heatindex_f": 41.5,
                         "dewpoint_c": 2.2,
                         "dewpoint_f": 35.9,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 7.5,
                         "gust_kph": 12.1,
                         "uv": 3.0,
                         "short_rad": 29.68,
                         "diff_rad": 14.01
                     },
                     {
                         "time_epoch": 1707732000,
                         "time": "2024-02-12 10:00",
                         "temp_c": 6.4,
                         "temp_f": 43.5,
                         "is_day": 1,
                         "condition": {
                             "text": "Sunny",
                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                             "code": 1000
                         },
                         "wind_mph": 6.9,
                         "wind_kph": 11.2,
                         "wind_degree": 271,
                         "wind_dir": "W",
                         "pressure_mb": 1005.0,
                         "pressure_in": 29.68,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 73,
                         "cloud": 6,
                         "feelslike_c": 4.1,
                         "feelslike_f": 39.4,
                         "windchill_c": 4.1,
                         "windchill_f": 39.4,
                         "heatindex_c": 6.4,
                         "heatindex_f": 43.5,
                         "dewpoint_c": 2.0,
                         "dewpoint_f": 35.6,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 8.9,
                         "gust_kph": 14.3,
                         "uv": 3.0,
                         "short_rad": 79.22,
                         "diff_rad": 25.84
                     },
                     {
                         "time_epoch": 1707735600,
                         "time": "2024-02-12 11:00",
                         "temp_c": 7.4,
                         "temp_f": 45.3,
                         "is_day": 1,
                         "condition": {
                             "text": "Sunny",
                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                             "code": 1000
                         },
                         "wind_mph": 8.5,
                         "wind_kph": 13.7,
                         "wind_degree": 281,
                         "wind_dir": "WNW",
                         "pressure_mb": 1006.0,
                         "pressure_in": 29.71,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 64,
                         "cloud": 4,
                         "feelslike_c": 4.9,
                         "feelslike_f": 40.9,
                         "windchill_c": 4.9,
                         "windchill_f": 40.9,
                         "heatindex_c": 7.4,
                         "heatindex_f": 45.3,
                         "dewpoint_c": 1.2,
                         "dewpoint_f": 34.1,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 10.5,
                         "gust_kph": 16.9,
                         "uv": 3.0,
                         "short_rad": 128.96,
                         "diff_rad": 35.69
                     },
                     {
                         "time_epoch": 1707739200,
                         "time": "2024-02-12 12:00",
                         "temp_c": 8.3,
                         "temp_f": 46.9,
                         "is_day": 1,
                         "condition": {
                             "text": "Sunny",
                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                             "code": 1000
                         },
                         "wind_mph": 8.7,
                         "wind_kph": 14.0,
                         "wind_degree": 284,
                         "wind_dir": "WNW",
                         "pressure_mb": 1007.0,
                         "pressure_in": 29.73,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 53,
                         "cloud": 0,
                         "feelslike_c": 5.9,
                         "feelslike_f": 42.6,
                         "windchill_c": 5.9,
                         "windchill_f": 42.6,
                         "heatindex_c": 8.3,
                         "heatindex_f": 46.9,
                         "dewpoint_c": -0.7,
                         "dewpoint_f": 30.8,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 10.5,
                         "gust_kph": 16.9,
                         "uv": 3.0,
                         "short_rad": 172.8,
                         "diff_rad": 42.7
                     },
                     {
                         "time_epoch": 1707742800,
                         "time": "2024-02-12 13:00",
                         "temp_c": 8.8,
                         "temp_f": 47.9,
                         "is_day": 1,
                         "condition": {
                             "text": "Sunny",
                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                             "code": 1000
                         },
                         "wind_mph": 8.9,
                         "wind_kph": 14.4,
                         "wind_degree": 282,
                         "wind_dir": "WNW",
                         "pressure_mb": 1007.0,
                         "pressure_in": 29.74,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 48,
                         "cloud": 0,
                         "feelslike_c": 6.5,
                         "feelslike_f": 43.8,
                         "windchill_c": 6.5,
                         "windchill_f": 43.8,
                         "heatindex_c": 8.8,
                         "heatindex_f": 47.9,
                         "dewpoint_c": -1.5,
                         "dewpoint_f": 29.4,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 10.7,
                         "gust_kph": 17.2,
                         "uv": 3.0,
                         "short_rad": 409.06,
                         "diff_rad": 74.28
                     },
                     {
                         "time_epoch": 1707746400,
                         "time": "2024-02-12 14:00",
                         "temp_c": 9.1,
                         "temp_f": 48.4,
                         "is_day": 1,
                         "condition": {
                             "text": "Sunny",
                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                             "code": 1000
                         },
                         "wind_mph": 9.6,
                         "wind_kph": 15.5,
                         "wind_degree": 275,
                         "wind_dir": "W",
                         "pressure_mb": 1008.0,
                         "pressure_in": 29.76,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 46,
                         "cloud": 0,
                         "feelslike_c": 6.8,
                         "feelslike_f": 44.2,
                         "windchill_c": 6.8,
                         "windchill_f": 44.2,
                         "heatindex_c": 9.1,
                         "heatindex_f": 48.4,
                         "dewpoint_c": -1.8,
                         "dewpoint_f": 28.8,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 11.7,
                         "gust_kph": 18.9,
                         "uv": 3.0,
                         "short_rad": 390.5,
                         "diff_rad": 72.74
                     },
                     {
                         "time_epoch": 1707750000,
                         "time": "2024-02-12 15:00",
                         "temp_c": 9.1,
                         "temp_f": 48.4,
                         "is_day": 1,
                         "condition": {
                             "text": "Sunny",
                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                             "code": 1000
                         },
                         "wind_mph": 10.1,
                         "wind_kph": 16.2,
                         "wind_degree": 270,
                         "wind_dir": "W",
                         "pressure_mb": 1009.0,
                         "pressure_in": 29.79,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 46,
                         "cloud": 7,
                         "feelslike_c": 6.7,
                         "feelslike_f": 44.0,
                         "windchill_c": 6.7,
                         "windchill_f": 44.0,
                         "heatindex_c": 9.1,
                         "heatindex_f": 48.4,
                         "dewpoint_c": -1.9,
                         "dewpoint_f": 28.6,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 12.8,
                         "gust_kph": 20.6,
                         "uv": 3.0,
                         "short_rad": 357.02,
                         "diff_rad": 69.5
                     },
                     {
                         "time_epoch": 1707753600,
                         "time": "2024-02-12 16:00",
                         "temp_c": 8.7,
                         "temp_f": 47.7,
                         "is_day": 1,
                         "condition": {
                             "text": "Sunny",
                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                             "code": 1000
                         },
                         "wind_mph": 8.9,
                         "wind_kph": 14.4,
                         "wind_degree": 261,
                         "wind_dir": "W",
                         "pressure_mb": 1009.0,
                         "pressure_in": 29.8,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 50,
                         "cloud": 4,
                         "feelslike_c": 6.4,
                         "feelslike_f": 43.6,
                         "windchill_c": 6.4,
                         "windchill_f": 43.6,
                         "heatindex_c": 8.7,
                         "heatindex_f": 47.7,
                         "dewpoint_c": -1.0,
                         "dewpoint_f": 30.1,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 12.0,
                         "gust_kph": 19.4,
                         "uv": 3.0,
                         "short_rad": 311.16,
                         "diff_rad": 64.01
                     },
                     {
                         "time_epoch": 1707757200,
                         "time": "2024-02-12 17:00",
                         "temp_c": 7.7,
                         "temp_f": 45.8,
                         "is_day": 1,
                         "condition": {
                             "text": "Sunny",
                             "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                             "code": 1000
                         },
                         "wind_mph": 8.9,
                         "wind_kph": 14.4,
                         "wind_degree": 253,
                         "wind_dir": "WSW",
                         "pressure_mb": 1010.0,
                         "pressure_in": 29.83,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 58,
                         "cloud": 12,
                         "feelslike_c": 5.1,
                         "feelslike_f": 41.2,
                         "windchill_c": 5.1,
                         "windchill_f": 41.2,
                         "heatindex_c": 7.7,
                         "heatindex_f": 45.8,
                         "dewpoint_c": -0.0,
                         "dewpoint_f": 31.9,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 13.2,
                         "gust_kph": 21.2,
                         "uv": 3.0,
                         "short_rad": 258.3,
                         "diff_rad": 54.91
                     },
                     {
                         "time_epoch": 1707760800,
                         "time": "2024-02-12 18:00",
                         "temp_c": 7.1,
                         "temp_f": 44.9,
                         "is_day": 0,
                         "condition": {
                             "text": "Partly Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                             "code": 1003
                         },
                         "wind_mph": 8.7,
                         "wind_kph": 14.0,
                         "wind_degree": 245,
                         "wind_dir": "WSW",
                         "pressure_mb": 1011.0,
                         "pressure_in": 29.85,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 62,
                         "cloud": 28,
                         "feelslike_c": 4.5,
                         "feelslike_f": 40.2,
                         "windchill_c": 4.5,
                         "windchill_f": 40.2,
                         "heatindex_c": 7.1,
                         "heatindex_f": 44.9,
                         "dewpoint_c": 0.5,
                         "dewpoint_f": 32.8,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 13.3,
                         "gust_kph": 21.3,
                         "uv": 1.0,
                         "short_rad": 215.26,
                         "diff_rad": 45.76
                     },
                     {
                         "time_epoch": 1707764400,
                         "time": "2024-02-12 19:00",
                         "temp_c": 6.9,
                         "temp_f": 44.3,
                         "is_day": 0,
                         "condition": {
                             "text": "Clear ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
                             "code": 1000
                         },
                         "wind_mph": 9.4,
                         "wind_kph": 15.1,
                         "wind_degree": 245,
                         "wind_dir": "WSW",
                         "pressure_mb": 1011.0,
                         "pressure_in": 29.87,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 64,
                         "cloud": 14,
                         "feelslike_c": 4.0,
                         "feelslike_f": 39.2,
                         "windchill_c": 4.0,
                         "windchill_f": 39.2,
                         "heatindex_c": 6.9,
                         "heatindex_f": 44.3,
                         "dewpoint_c": 0.7,
                         "dewpoint_f": 33.2,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 14.2,
                         "gust_kph": 22.9,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707768000,
                         "time": "2024-02-12 20:00",
                         "temp_c": 6.6,
                         "temp_f": 43.8,
                         "is_day": 0,
                         "condition": {
                             "text": "Partly Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                             "code": 1003
                         },
                         "wind_mph": 8.5,
                         "wind_kph": 13.7,
                         "wind_degree": 235,
                         "wind_dir": "SW",
                         "pressure_mb": 1012.0,
                         "pressure_in": 29.88,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 67,
                         "cloud": 27,
                         "feelslike_c": 3.9,
                         "feelslike_f": 38.9,
                         "windchill_c": 3.9,
                         "windchill_f": 38.9,
                         "heatindex_c": 6.6,
                         "heatindex_f": 43.8,
                         "dewpoint_c": 0.8,
                         "dewpoint_f": 33.5,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 13.0,
                         "gust_kph": 20.9,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707771600,
                         "time": "2024-02-12 21:00",
                         "temp_c": 6.2,
                         "temp_f": 43.2,
                         "is_day": 0,
                         "condition": {
                             "text": "Partly Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                             "code": 1003
                         },
                         "wind_mph": 8.9,
                         "wind_kph": 14.4,
                         "wind_degree": 225,
                         "wind_dir": "SW",
                         "pressure_mb": 1013.0,
                         "pressure_in": 29.9,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 70,
                         "cloud": 45,
                         "feelslike_c": 3.4,
                         "feelslike_f": 38.0,
                         "windchill_c": 3.4,
                         "windchill_f": 38.0,
                         "heatindex_c": 6.2,
                         "heatindex_f": 43.2,
                         "dewpoint_c": 1.2,
                         "dewpoint_f": 34.1,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 13.8,
                         "gust_kph": 22.1,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707775200,
                         "time": "2024-02-12 22:00",
                         "temp_c": 6.1,
                         "temp_f": 43.1,
                         "is_day": 0,
                         "condition": {
                             "text": "Partly Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                             "code": 1003
                         },
                         "wind_mph": 10.1,
                         "wind_kph": 16.2,
                         "wind_degree": 229,
                         "wind_dir": "SW",
                         "pressure_mb": 1013.0,
                         "pressure_in": 29.91,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 69,
                         "cloud": 59,
                         "feelslike_c": 3.0,
                         "feelslike_f": 37.4,
                         "windchill_c": 3.0,
                         "windchill_f": 37.4,
                         "heatindex_c": 6.1,
                         "heatindex_f": 43.1,
                         "dewpoint_c": 0.9,
                         "dewpoint_f": 33.6,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 15.5,
                         "gust_kph": 25.0,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     },
                     {
                         "time_epoch": 1707778800,
                         "time": "2024-02-12 23:00",
                         "temp_c": 6.1,
                         "temp_f": 43.0,
                         "is_day": 0,
                         "condition": {
                             "text": "Partly Cloudy ",
                             "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                             "code": 1003
                         },
                         "wind_mph": 10.5,
                         "wind_kph": 16.9,
                         "wind_degree": 230,
                         "wind_dir": "SW",
                         "pressure_mb": 1013.0,
                         "pressure_in": 29.93,
                         "precip_mm": 0.0,
                         "precip_in": 0.0,
                         "snow_cm": 0.0,
                         "humidity": 68,
                         "cloud": 49,
                         "feelslike_c": 2.8,
                         "feelslike_f": 37.1,
                         "windchill_c": 2.8,
                         "windchill_f": 37.1,
                         "heatindex_c": 6.1,
                         "heatindex_f": 43.0,
                         "dewpoint_c": 0.7,
                         "dewpoint_f": 33.3,
                         "will_it_rain": 0,
                         "chance_of_rain": 0,
                         "will_it_snow": 0,
                         "chance_of_snow": 0,
                         "vis_km": 10.0,
                         "vis_miles": 6.0,
                         "gust_mph": 16.3,
                         "gust_kph": 26.2,
                         "uv": 1.0,
                         "short_rad": 0.0,
                         "diff_rad": 0.0
                     }
                 ]
             }
         ]
     }
 }

 */
