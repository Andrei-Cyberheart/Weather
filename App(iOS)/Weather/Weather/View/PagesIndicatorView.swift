//
//  PagesIndicatorView.swift
//  Weather
//
//  Created by Andrei Ulanov on 08.07.2023.
//

import SwiftUI

struct PagesIndicatorView: View {
    @State private var currentPage = 0
        let totalPages = 3 // Update this value based on the number of pages

        var body: some View {
            VStack {
                // Main content of your app goes here
            }
            .overlay(PageIndicator(currentPage: $currentPage, totalPages: totalPages)
                        .padding(.top, 16), alignment: .top)
        }
}

struct PageIndicator: UIViewRepresentable {
    @Binding var currentPage: Int
    let totalPages: Int

    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = totalPages
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .gray
        return pageControl
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

struct PagesIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PagesIndicatorView()
    }
}
