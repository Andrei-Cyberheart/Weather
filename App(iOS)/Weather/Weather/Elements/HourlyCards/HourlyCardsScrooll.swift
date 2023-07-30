//
//  HourScroollCards.swift
//  Weather
//
//  Created by Andrei Ulanov on 08.07.2023.
//

import SwiftUI

struct HourlyCardsScrooll: View {
    @State private var currentPage = 0
       private let totalPages = 5 // Total number of pages in the ScrollView
       private let indicatorsPerRow = 5 // Number of indicators per row
       
       var body: some View {
           VStack {
               ScrollViewReader { scrollViewProxy in
                   TabView(selection: $currentPage) {
                       ForEach(0..<totalPages) { page in
                           GeometryReader { geometry in
                              HourlyCard()
                                   .frame(width: geometry.size.width, height: geometry.size.height)
                           }
                           .tag(page)
                       }
                   }
                   .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                   .onChange(of: currentPage) { newPage in
                       withAnimation {
                           scrollViewProxy.scrollTo(newPage, anchor: .leading)
                       }
                   }
               }
               
               VStack {
                   ForEach(0..<totalPages/indicatorsPerRow, id: \.self) { rowIndex in
                       HStack(spacing: 5) {
                           ForEach(rowIndex*indicatorsPerRow..<(rowIndex+1)*indicatorsPerRow) { page in
                               Button(action: { currentPage = page }) {
                                   ZStack {
                                       RoundedRectangle(cornerRadius: 5)
                                           .frame(width: 40, height: 40)
                                           .foregroundColor(page == currentPage ? .black : .white)
                                       Image(systemName: "m.circle")
                                   }.foregroundColor(page == currentPage ? Color.white : Color.black)
                               }
                           }
                       }
                   }
               }.shadow(color: .black, radius: 5)
           }
       }
}


struct HourScroollCards_Previews: PreviewProvider {
    static var previews: some View {
        HourlyCardsScrooll()
    }
}
