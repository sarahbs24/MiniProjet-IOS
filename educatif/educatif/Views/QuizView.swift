//
//  QuizView.swift
//  educatif
//
//  Created by sarrabs on 29/11/2023.
//

import SwiftUI

struct QuizView: View {
    let cours: Cours

    var body: some View {
        VStack {
            Text("Quiz for \(cours.title)")
                .font(.title)
                .padding()

            // Add your quiz-related content here

            Spacer()
        }
        .navigationTitle("Quiz")
    }
}
