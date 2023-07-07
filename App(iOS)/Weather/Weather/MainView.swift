//
//  ContentView.swift
//  Weather
//
//  Created by Andrei Ulanov on 07.07.2023.
//

import SwiftUI

struct MainView: View {
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
                    ScrollView (.horizontal, showsIndicators: true) {
                        
                        HStack {
                            ForEach(1..<40) {_ in
                                NavigationLink {
                                    AdvancedDetailView()
                                } label: {
                                    AdvencedCard().padding(.horizontal)
                                }
                            }
                        }
                    }
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
                .previewDisplayName("iPhone 8")
        }
    }
}
