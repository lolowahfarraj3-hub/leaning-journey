//
//  leaning_journeyApp.swift
//  leaning journey
//
//  Created by lulwah on 24/04/1447 AH.
//
import SwiftUI

@main
struct LeaningJourneyApp: App {   // name can be anything, just one @main
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                OnboardingView()   // Page 1
            }
        }
    }
}
