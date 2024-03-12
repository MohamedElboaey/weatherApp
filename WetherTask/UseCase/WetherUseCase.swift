//
//  WetherUseCase.swift
//  WetherTask
//
//  Created by Mohamed Elboraey on 12/02/2024.
//

import Foundation

class WetherUseCase {
    let stringURL = "https://api.weatherapi.com/v1/forecast.json?key=51c4d18084674fdbb7503616241102&q=London&days=1&aqi=no&alerts=no"
    
    func fetchWether() async throws -> WeatherResponse {
        guard let url = URL(string: stringURL) else {return WeatherResponse.init(location: nil, current: nil, forecast: nil)}
        do {
            let (data, respons) = try await URLSession.shared.data(from: url)
            let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
            return weather
        } catch {
            print("error is \(error.localizedDescription)")
            return WeatherResponse.init(location: nil, current: nil, forecast: nil)
        }
    }
}


// clmpletionHandeler

extension WetherUseCase {
    func fetchWeather(cityName: String, completion: @escaping(Result<WeatherResponse,Error>)-> Void) {

        let stringURL = "https://api.weatherapi.com/v1/forecast.json?key=51c4d18084674fdbb7503616241102&q=\(cityName)&days=1&aqi=no&alerts=no"
    
        guard let url = URL(string: stringURL) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
                print("did recive data \(String(describing: data))")
                guard let data = data else {return}
            let stringData = String(data: data, encoding: .utf8)
            do {
                 let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(weather))
            } catch {
                completion(.failure(error))
            }
            }.resume()
        }
}
