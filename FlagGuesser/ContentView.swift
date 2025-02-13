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
            LinearGradient(colors: [.black, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag!")
                    .foregroundStyle(.white)
                    .font(.largeTitle.weight(.bold))
                VStack (spacing:20) {
                    VStack {
                        Text("What is the flag of")
                            .foregroundStyle(.black)
                            .font(.headline.weight(.heavy))
                        Text(countries[answer])
                            .foregroundStyle(.black)
                            .font(.largeTitle.weight(.bold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagAnswer(number)
                        }
                        label: {
                            Image(countries[number])
                                .shadow(radius: 20)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(32)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius:15))
                
                Spacer()
                Spacer()
                
                Text("Score: ")
                    .foregroundStyle(.white)
                    .font(.title.weight(.bold))
                
                Spacer()
                
            }
            .padding()
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
        countries.shuffle()
        answer = Int.random(in: 0..<3)
    }
}

#Preview {
    ContentView()
}
