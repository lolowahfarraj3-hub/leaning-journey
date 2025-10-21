//
//  ContentView.swift
//  leaning journey
//
//  Created by lulwah on 24/04/1447 AH.
//

import SwiftUI

struct learningjourney: View {
    @State private var topic = ""
    @State private var duration = "Week"
    private let options = ["Week", "Month", "Year"]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 24) {
                Spacer(minLength: 20)

                Image("toplogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .frame(maxWidth: .infinity)

                Text("Hello Learner").font(.system(size: 42, weight: .bold))
                Text("This app will help you learn everyday!").foregroundColor(.gray)

                Text("I want to learn").font(.title3).bold()
                TextField("Swift", text: $topic)
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(12)
                    .foregroundColor(.white)

                Text("I want to learn it in a").font(.title3).bold()
                Picker("", selection: $duration) {
                    ForEach(options, id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(.segmented)

                Spacer()

                Button("Start learning") { }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(
                        LinearGradient(colors: [.orange, .orange.opacity(0.85)],
                                       startPoint: .leading, endPoint: .trailing)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(28)
            }
            .padding(24)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    OnboardingView().preferredColorScheme(.dark)
}

