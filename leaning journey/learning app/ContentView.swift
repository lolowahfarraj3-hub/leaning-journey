import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            OnboardingView()
                .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
