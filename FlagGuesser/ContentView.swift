//
//  ContentView.swift
//  FlagGuesser
//
//  Created by Harriet Mathew on 12/2/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var answer = Int.random(in: 0..<3)
    @State private var title = " "
    @State private var scoreDisplay = false
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Which is the correct flag of")
                        .foregroundStyle(.white)
                    Text(countries[answer])
                        .foregroundStyle(.white)
                }
                ForEach(0..<3) { number in
                    Button {
                        flagAnswer(number)
                    }
                    label: {
                        Image(countries[number])
                    }
                }
            }
        }
        .alert(title, isPresented: $scoreDisplay) {
            Button("Next Question", action: nextQuestion)
        } message: {
            Text("")
        }
    }
    func flagAnswer(_ number: Int) {
        if number == answer {
            title = "You're right!"
        } else {
            title = "Oops, that was wrong."
        }
        scoreDisplay = true
    }
    
    func nextQuestion() {
        countries.shuffled()
        answer = Int.random(in: 0..<3)
    }
}

#Preview {
    ContentView()
}
