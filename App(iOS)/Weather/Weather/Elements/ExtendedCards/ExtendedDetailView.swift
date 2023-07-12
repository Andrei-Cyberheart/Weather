//
//  AdvancedDetailView.swift
//  Weather
//
//  Created by Andrei Ulanov on 07.07.2023.
//

import SwiftUI

struct ExtendedDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 30) {
                    
                    HStack {
                        Text("03:00")
                        Spacer()
                        Text("04.05.2016")
                    }.font(.largeTitle)
                    
                    
                    Text("London, England")
                        .font(.largeTitle)
                    
                    VStack(alignment: .leading) {
                        Text("22 ºC")
                            .font(.largeTitle)
                    }
                    Spacer()
                    Group {
                        Text("Clouds: 17 %")
                        Text("Huminidity: 30 %")
                        Text("Visibility: 70 %")
                        Text("Wind: 4 m/s NW")
                    }
                    .font(.title)
                }
                .padding(.all, UIScreen.main.bounds.height/35)
                .foregroundColor(Color("FontColor"))
                .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height*0.8, alignment: .center)
                .blurBackground(style: colorScheme == .dark ? .dark : .light)
                .cornerRadius(20)
                .shadow(color: .black, radius: 5)
                Spacer()
            }
        }
    }
}

struct AdvancedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExtendedDetailView()
    }
}
