//
//  View+Extensions.swift
//  Weather
//
//  Created by Andrei Ulanov on 07.07.2023.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct BlurBackground: ViewModifier {
    var style: UIBlurEffect.Style
    
    func body(content: Content) -> some View {
        content
            .background(
                VisualEffectView(effect: UIBlurEffect(style: style == .dark ? .dark : .light))
            )
    }
}

extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        self.modifier(BlurBackground(style: style))
    }
}
