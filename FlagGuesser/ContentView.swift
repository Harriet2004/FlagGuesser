//
//  ContentView.swift
//  FlagGuesser
//
//  Created by Harriet Mathew on 12/2/2025.
//

import SwiftUI

struct ContentView: View {
    let countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    var answer = Int.random(in: 0..<3)
    var body: some View {
        VStack {
            VStack {
                Text("Which is the correct flag of")
                Text(countries[answer])
            }
            ForEach(0..<3) { number in
                Button {
                }
                label: {
                    Image(countries[number])
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
