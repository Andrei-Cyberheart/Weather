//
//  MainCard.swift
//  Weather
//
//  Created by Andrei Ulanov on 07.07.2023.
//

import SwiftUI

struct MainCard: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading, spacing: 30) {
                // City, Country, Date
                HStack {
                    Text("London, England")
                    Spacer()
                    Text("22.10.2023")
                }
               // Temperature
                HStack {
                    
                    Text("23 ºC")
                        .font(.largeTitle)
                   // Temperature feel, min, max
                    VStack(alignment: .leading) {
                        Text("feel: 23 ºC")
                        Text("min: 20 ºC")
                        Text("max: 25 ºC")
                    }
                }
                Spacer()
                // Condition
                HStack {
                    // Huminidity, Clouds
                    VStack(alignment: .leading) {
                        Text("Humidity: 100%")
                        Text("Clouds: 100%")
                    }
                    Spacer()
                    // Visibility, Wind
                    VStack(alignment: .leading) {
                        Text("Visibility: 20%")
                        HStack {
                            Text("Wind: 4 m/s")
                            Text("NW")
                        }
                    }
                }
            }
            .padding(.all, UIScreen.main.bounds.height/35)
        }
        .foregroundColor(Color("FontColor"))
        .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height/2, alignment: .center)
        .blurBackground(style: colorScheme == .dark ? .dark : .light)
        .cornerRadius(20)
        .shadow(color: .black, radius: 5)
    }
}

struct MainCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.purple.ignoresSafeArea()
            MainCard()
        }
    }
}
