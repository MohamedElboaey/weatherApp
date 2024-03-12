//
//  Home.swift
//  WetherTask
//
//  Created by Mohamed Elboraey on 10/02/2024.
//

import SwiftUI

struct Home: View {
//    @State var city = CitiesViewModel().weather
    let weather: WeatherResponse?
    @State var offset: CGFloat = 0
    @State var topEdge: CGFloat = 0
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            
            GeometryReader { proxy in
                Image("sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
//            .overlay(.ultraThinMaterial)
            
            
            ScrollView(.vertical,showsIndicators: false) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32,height: 32)
                        }
                        .padding(.trailing,320)
                }
                VStack {
//                    weather Data View....
                    VStack(alignment: .center, spacing: 5) {
                        Text(weather?.location?.name ?? "")
                            .font(.system(size: 35))
//                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                        
                        Text(String(format: "%.1fº", weather?.current?.temp_c ?? 0.0))
                            .font(.system(size: 45))
//                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                        
                        Text("\(weather?.current?.condition.text ?? "")")
                            .foregroundStyle(.secondary)
//                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                        
                        Text("H:22º L:5º")
                            .foregroundStyle(.primary)
//                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                    }
                    .offset(y: -offset)
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: geTitleOffset())
//                    custom Data view...
                    VStack(spacing: 8) {
//                        custom stack...
                        CustomStackView {
                            Label {
                                Text("Hourly Forecast")
                            } icon: {
                                Image(systemName: "clock")
                            }

                        } contentView: {
//                            content...
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForeCastView(time: "12 PM", degree: CGFloat(weather?.forecast?.forecastday[0].hour[13].temp_c ?? 0.0), image: "sun.min")
                                    ForeCastView(time: "1 PM", degree: CGFloat(weather?.forecast?.forecastday[0].hour[14].temp_c ?? 0.0), image: "sun.haze")
                                    ForeCastView(time: "2 PM", degree: CGFloat(weather?.forecast?.forecastday[0].hour[15].temp_c ?? 0.0), image: "sun.min")
                                    ForeCastView(time: "3 PM", degree: CGFloat(weather?.forecast?.forecastday[0].hour[16].temp_c ?? 0.0), image: "sun.min")
                                    ForeCastView(time: "4 PM", degree: CGFloat(weather?.forecast?.forecastday[0].hour[17].temp_c ?? 0.0), image: "cloud.sun")
                                    ForeCastView(time: "5 PM", degree: CGFloat(weather?.forecast?.forecastday[0].hour[18].temp_c ?? 0.0), image: "sun.haze")
                                }
                            }
                        }
                        
                        WeatherDataView()

                    }
                }
                .padding(.top, 55)
                .padding([.horizontal,.bottom])
//                getting offset....
                .overlay(
//                using geometry reder....
                    GeometryReader { proxy -> Color in
                        
                        let minY = proxy.frame(in: .global).minY
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        
                        return Color.clear
                        
                    }
                
                )
                
            }
        }
    }
    func getTitleOpacity() -> CGFloat {
        let titleOffset = geTitleOffset()
        let progress = titleOffset / 5
        let opacity = 1 - progress
        return opacity
    }
    
    func geTitleOffset() -> CGFloat {
        if offset < 0 {
            let progress = offset / 90
           let newOffset = (progress <= 1.0 ? progress : 1) * 5
           return -newOffset
        }
        return 0
    }
}

#Preview {
    Home(weather: nil)
}

struct ForeCastView: View {
    var time: String
    var degree: CGFloat
    var image: String
    var body: some View {
        VStack(spacing: 15) {
            Text(time)
                .font(.callout.bold())
//                .foregroundStyle(.white)
            
            Image(systemName: image)
                .font(.title2)
            //     multiColors...
                .symbolVariant(.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .white)
            //     maxFrame...
                .frame(height: 30)
            
            Text("\(Int(degree))º")
                .font(.callout.bold())
//                .foregroundStyle(.white)
        }
        .padding(.horizontal, 10)
    }
}
