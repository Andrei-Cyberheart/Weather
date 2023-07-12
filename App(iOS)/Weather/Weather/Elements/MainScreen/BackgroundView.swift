//
//  Background.swift
//  Weather
//
//  Created by Andrei Ulanov on 07.07.2023.
//

import SwiftUI

enum TimeOfDay {
    case morning
    case afternoon
    case evening
    case night
}

struct BackgroundView: View {
    @State private var timeOfDay: TimeOfDay = .morning
    var body: some View {
        // Определение фона в зависимости от времени суток
        LinearGradient(gradient: Gradient(colors: getBackgroundColors(for: timeOfDay)), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .onAppear {
                // Проверка времени суток при запуске приложения
                updateTimeOfDay()
                // Обновление времени суток при изменении времени
                Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
                    withAnimation {
                        updateTimeOfDay()
                    }
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                // Проверка времени суток при возвращении в приложение из фона
                updateTimeOfDay()
            }
        
            
    }
    
    // Функция для получения цветов фона в зависимости от времени суток
    private func updateTimeOfDay() {
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        switch currentHour {
        case 6..<12:
            timeOfDay = .morning
        case 12..<18:
            timeOfDay = .afternoon
        case 18..<22:
            timeOfDay = .evening
        default:
            timeOfDay = .night
        }
    }
    // Функция для определения времени суток
    private func getBackgroundColors(for timeOfDay: TimeOfDay) -> [Color] {
        switch timeOfDay {
        case .morning:
            return [Color.blue.opacity(0.5), Color(red: 0, green: 0.2, blue: 0.5).opacity(1)]
        case .afternoon:
            return [Color(red: 0, green: 0.2, blue: 0.5).opacity(0.5), Color.orange.opacity(1)]
        case .evening:
            return [Color.orange.opacity(0.5), Color.purple.opacity(1)]
        case .night:
            return [Color.purple.opacity(0.5), Color.blue.opacity(1)]
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
