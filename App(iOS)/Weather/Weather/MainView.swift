//
//  ContentView.swift
//  Weather
//
//  Created by Andrei Ulanov on 07.07.2023.
//

import SwiftUI

struct MainView: View {
    
    @State private var currentPage = 0
    
    var body: some View {
        NavigationView{
            ZStack {
                BackgroundView()
                
                VStack {
                    Spacer()
                    SearchView()
                    Spacer()
                    MainCard()
                    Spacer()
                    HourScroollCards()
                    Spacer()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
            MainView().previewDevice("iPhone 8")
                .previewDisplayName("iPhone 8 Plus")
        }
    }
}
