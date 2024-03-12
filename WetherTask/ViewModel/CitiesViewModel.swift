//
//  CitiesViewModel.swift
//  WetherTask
//
//  Created by Mohamed Elboraey on 11/02/2024.
//

import Foundation

class CitiesViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    @Published var error = ""
    @Published var weatherList : [WeatherResponse] = []
    private let useCase = WetherUseCase()
    
    init() {
        Task { try await fetchAwait() }
    }
    
    func fetchAwait() async throws {
        DispatchQueue.main.async {
            Task {
                self.weather = try? await self.useCase.fetchWether()
                if let weather = self.weather {
                    self.weatherList.append(weather)
                }
                print(self.weather)
            }
        }
    }
    
    func fetchWeather(cityName: String) {
        useCase.fetchWeather(cityName: cityName) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self?.weather = weather
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}
