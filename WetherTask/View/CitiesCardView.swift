//
//  CitiesCardView.swift
//  WetherTask
//
//  Created by Mohamed Elboraey on 10/02/2024.
//

import SwiftUI

struct CitiesCardView: View {
    var image: String
    var city: String
       var time: String
       var temperature: String
       var weather: String
       var highTemperature: String
    var lowTemperature: String
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 140)
                .scaledToFit()
//                .tint(.black)
            VStack(spacing: 12) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(city)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text(time)
                            .font(.footnote)
                        
                            
                    }
                    Spacer()
                    Text("\(temperature)º")
                        .font(.largeTitle)
                    
                }.padding(.horizontal, 24)
                
                HStack() {
                    Text(weather)
                        .font(.footnote)
                    Spacer()
                    HStack(spacing: 4) {
                        Text("H:\(highTemperature)º")
                        Text("L:\(lowTemperature)º")
                    }
                }
                .padding(.horizontal,24)
            }
        }
//        .padding(.vertical, 12)
        .background(Color.brown)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

#Preview {
    CitiesCardView(image: "sky", city: "City", time: "9:00", temperature: "70", weather: "sunny", highTemperature: "70", lowTemperature: "20")
}
