//
//  ContentView.swift
//  WetherTask
//
//  Created by Mohamed Elboraey on 10/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CitiesViewModel()
    @State private var searchText = ""
    @State private var selectedItem: String?
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.weatherList, id:\.self) { city in
                        NavigationLink(value: city) {
                            CitiesCardView(image: "sky", city: "\(city.location?.name ?? "")", time: "\(city.location?.localtime ?? "")", temperature:  "\(city.current?.temp_c ?? 0.0)", weather: "\(city.current?.condition.text ?? "")", highTemperature: "\(city.current?.cloud ?? 0)", lowTemperature: "\(city.current?.gust_kph ?? 0.0)")
                                .foregroundStyle(.black)
                        }
                    }
                }
            }.navigationTitle("Weather")
            
             .searchable(text: $searchText, prompt: "Search for a City")
             .navigationDestination(for: WeatherResponse.self) { weather in
                 GeometryReader { proxy in
                     let topEdge = proxy.safeAreaInsets.top
                     Home(weather: viewModel.weatherList[0], topEdge: topEdge)
                         .navigationBarBackButtonHidden()
                 }
                 
             }
                
        }
        
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
