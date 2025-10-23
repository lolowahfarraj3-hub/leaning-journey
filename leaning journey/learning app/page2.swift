import SwiftUI

struct page2: View {
    @State private var daysLearned = 3
    @State private var daysFreezed = 1
    @State private var freezeQuota = 2

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 24) {
                // Header
                HStack {
                    Text("Activity")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    Spacer()
                    HeaderIcon("square.grid.2x2.fill")
                    HeaderIcon("arrow.clockwise")
                }

                // Stats row (optional)
                HStack(spacing: 12) {
                    StatCard(
                        icon: "flame.fill",
                        count: daysLearned,
                        title: "Days Learned",
                        bg: Color(red: 0.31, green: 0.19, blue: 0.08)
                    )
                    StatCard(
                        icon: "cube.fill",
                        count: daysFreezed,
                        title: "Day Freezed",
                        bg: Color(red: 0.07, green: 0.17, blue: 0.24)
                    )
                }

                // If you have a calendar, drop it here
                // CalendarCard(...)

                Spacer() // keep top area airy; bottom UI is pinned via safeAreaInset
            }
            .padding(20)
        }
        // 🔻 Bottom-pinned action + hint
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 10) {
                Button {
                    if daysFreezed < freezeQuota { daysFreezed += 1 }
                } label: {
                    Text("Log as Freezed")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(
                            Capsule().fill(Color(red: 0.09, green: 0.25, blue: 0.29))
                        )
                }

                Text("\(min(daysFreezed, freezeQuota)) out of \(freezeQuota) Freezes used")
                    .font(.footnote)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 12) // breathing room from the very bottom
            .background(Color.black.opacity(0.001)) // touch-friendly, visually invisible
        }
    }
}

// MARK: - Helpers in the SAME FILE

private struct HeaderIcon: View {
    let system: String
    init(_ system: String) { self.system = system }
    var body: some View {
        Image(systemName: system)
            .font(.title3)
            .foregroundStyle(.white)
            .padding(10)
            .background(Circle().fill(.white.opacity(0.08)))
    }
}

private struct StatCard: View {
    let icon: String
    let count: Int
    let title: String
    let bg: Color

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 24, weight: .bold))
            VStack(alignment: .leading, spacing: 2) {
                Text("\(count)")
                    .font(.system(size: 28, weight: .bold))
                Text(title)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.9))
            }
            Spacer()
        }
        .foregroundStyle(.white)
        .padding(16)
        .background(bg)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: .black.opacity(0.25), radius: 12, y: 8)
    }
}

// MARK: - Preview
#Preview {
    NavigationStack { page2() }
        .preferredColorScheme(.dark)
}
