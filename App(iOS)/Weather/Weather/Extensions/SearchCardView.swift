//
//  SearchCardView.swift
//  Weather
//
//  Created by Andrei Ulanov on 07.07.2023.
//

import SwiftUI

struct SearchCardView: View {
    @Environment(\.colorScheme) var colorScheme
    //@Binding var place: String
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.clear)
                        
                        Image(systemName: "location.fill")
                    }
                }
                
                .frame(width: 30, height: 30)
                .accessibilityIdentifier("LicationButton")
            .padding(.trailing, UIScreen.main.bounds.height/35)
            }
        }
        .foregroundColor(Color("FontColor"))
        .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height/18, alignment: .center)
        
        .blurBackground(style: colorScheme == .dark ? .dark : .light)
        .cornerRadius(20)
        .shadow(color: .black, radius: 5)
    }
}

struct SearchCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.purple.ignoresSafeArea()
            SearchCardView()
        }
        MainView().previewDisplayName("Main")
    }
}
