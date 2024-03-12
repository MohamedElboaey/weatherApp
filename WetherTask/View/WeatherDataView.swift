//
//  WeatherDataView.swift
//  WetherTask
//
//  Created by Mohamed Elboraey on 10/02/2024.
//

import SwiftUI

struct WeatherDataView: View {
    var body: some View {
        VStack(spacing: 8) {
            CustomStackView {
                    Label {
                        Text("10-Days Forecast")
                    } icon: {
                        Image(systemName: "calendar")
                    }
            } contentView: {
                VStack(alignment:.leading, spacing: 10) {
                    ForEach(1 ... 10 , id: \.self) { cast in
                        HStack(spacing: 15) {
                            Text("today")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
//                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Image(systemName: "sun.max.fill")
                                .font(.title3)
                                .symbolVariant(.fill)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.yellow, .white)
                            
                            Spacer()
                                .frame(maxWidth: 60)
                            
                            Text("56º")
                                .font(.title3.bold())
                                .foregroundStyle(.secondary)
//                                .foregroundStyle(.white)
                            
                            ZStack(alignment: .leading){
                                Capsule()
                                    .fill(.tertiary)
//                                    .foregroundStyle(.white)
                                
                                GeometryReader { proxy in
                                    Capsule()
                                        .fill(.linearGradient(.init(colors: [.orange,.red]), startPoint: .leading, endPoint: .trailing))
                                        .frame(width: 0.3 * proxy.size.width)
                                }
                                
                            }
                            .frame(height: 4)
                            
                            Text("56º")
                                .font(.title3.bold())
//                                .foregroundStyle(.white)
                        }
                        Divider()
                    }
                }
            }

            
            HStack {
                CustomStackView {
                    Label {
                        Text("UV Index")
                    } icon: {
                        Image(systemName: "sun.min")
                    }

                } contentView: {
                    VStack(alignment:.leading, spacing: 10) {
                        Text("0")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Low")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
//                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight:.infinity, alignment: .leading)
                }

                CustomStackView {
                    Label {
                        Text("Rainfull")
                    } icon: {
                        Image(systemName: "drop.fill")
                    }
                } contentView: {
                    VStack(alignment:.leading, spacing: 10) {
                        Text("0 mm")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("in last 24 hours")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
//                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
            }
            .frame(maxHeight: .infinity)

        }
    }
}

#Preview {
    WeatherDataView()
}
