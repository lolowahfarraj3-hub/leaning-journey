import SwiftUI

struct OnboardingView: View {

    // State
    @State private var subject: String = "Swift"
    @State private var selectedPeriod: Period = .week

    // Types
    enum Period: String, CaseIterable, Identifiable {
        case week = "Week", month = "Month", year = "Year"
        var id: String { rawValue }
    }

    // Style
    private let bg = Color.black
    private let textPrimary = Color.white
    private let textSecondary = Color.white.opacity(0.6)
    private let controlBG = Color.white.opacity(0.08)
    private let divider = Color.white.opacity(0.18)
    private let accent = Color(red: 0.78, green: 0.33, blue: 0.02)

    var body: some View {
        ZStack {
            bg.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {
                // Top logo
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.06))
                            .frame(width: 96, height: 96)
                            .overlay(
                                Circle().stroke(accent.opacity(0.7), lineWidth: 2)
                            )
                            .shadow(color: accent.opacity(0.35), radius: 24, x: 0, y: 8)
                        Image(systemName: "flame.fill")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundStyle(accent)
                    }
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.bottom, 4)

                // Title + subtitle
                VStack(alignment: .leading, spacing: 6) {
                    Text("Hello Learner")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(textPrimary)
                    Text("This app will help you learn everyday!")
                        .font(.subheadline)
                        .foregroundStyle(textSecondary)
                }

                // Subject field
                VStack(alignment: .leading, spacing: 8) {
                    Text("I want to learn")
                        .font(.headline)
                        .foregroundColor(.white)

                    TextField("", text: $subject)
                        .font(.body)
                        .foregroundStyle(textSecondary)
                        .padding(.vertical, 8)

                    Rectangle()
                        .fill(divider)
                        .frame(height: 1)
                }

                // Period buttons
                VStack(alignment: .leading, spacing: 12) {
                    Text("I want to learn it in a")
                        .font(.headline)
                        .foregroundColor(.white)

                    HStack(spacing: 12) {
                        ForEach(Period.allCases) { p in
                            Button {
                                selectedPeriod = p
                            } label: {
                                Text(p.rawValue)
                                    .font(.subheadline).fontWeight(.semibold)
                                    .padding(.horizontal, 18)
                                    .padding(.vertical, 10)
                                    .background(
                                        Capsule()
                                            .fill(p == selectedPeriod ? accent : controlBG)
                                    )
                                    .foregroundStyle(p == selectedPeriod ? Color.white : textPrimary.opacity(0.85))
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.white.opacity(0.14), lineWidth: p == selectedPeriod ? 0 : 1)
                                    )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }

                Spacer()

        
                // CTA
                HStack {
                    Spacer()
                    NavigationLink {
                        page2(subject: subject, period: selectedPeriod)   // ✅ correct init
                    } label: {
                        Text("Start learning")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 28)
                            .padding(.vertical, 16)
                            .background(Capsule().fill(accent))
                    }
                    .shadow(color: accent.opacity(0.45), radius: 18, x: 0, y: 10)
                    Spacer()
                }

                }
                .padding(.bottom, 8)
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
        }
    }

#Preview {
    NavigationStack {   // ✅ Needed for NavigationLink in preview
        OnboardingView()
            .preferredColorScheme(.dark)
    }
}
