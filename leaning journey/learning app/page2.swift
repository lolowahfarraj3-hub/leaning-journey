import SwiftUI

struct page2: View {
    let subject: String
    let period: OnboardingView.Period

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Page 2 • \(subject) • \(period.rawValue)")
                .foregroundStyle(.white)
                .padding()
        }
    }
}
