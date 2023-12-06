//
//  QuizView.swift
//  educatif
//
//  Created by sarrabs on 29/11/2023.
//

import SwiftUI

struct QuizView: View {
    @State private var quizs: [Quiz1] = [
        Quiz1(question: "Quels sont les nutriments essentiels que l'on trouve généralement dans les fruits et légumes?",
              answer1: "a) Protéines et lipides", answer2: "b) Fibres, potassium, vitamine C et folates", answer3: "c) Glucides simples et graisses saturées", correctAnswerNumber: 2),
        Quiz1(question: "Pourquoi les fruits et légumes sont-ils considérés comme bénéfiques pour la santé?",
              answer1: "a) Ils contiennent des milliers de composés chimiques artificiels.", answer2: "b) Ils sont riches en graisses saturées.", answer3: "c) Ils sont sources de fibres, de vitamine C, de potassium et de composés phytochimiques protecteurs.", correctAnswerNumber: 3),
        Quiz1(question: "Quel rôle jouent les composés phytochimiques présents dans les fruits et légumes?",
              answer1: "a) Ils sont responsables du goût sucré des fruits.", answer2: "b) Ils protègent contre les maladies.", answer3: "c) Ils n'ont aucun effet sur la santé.", correctAnswerNumber: 2),
    ]
    
    @State private var numberOfGoodAnswers: Int = 0
    @State private var currentQuizIndex: Int = 0
    @State private var isQuizComplete: Bool = false
    @State private var remainingTime: Int = 10
    @State private var timer: Timer?
    @State private var showingResult: Bool = false

    var body: some View {
        VStack {
            Text("Time: \(remainingTime) seconds")
                .font(.subheadline)
                .foregroundColor(.red)
                .padding()

            Text(currentQuizIndex < quizs.count ? quizs[currentQuizIndex].question : "")
                .font(.title)
                .colorInvert()
                .bold()
                .padding()
                .background(Color.yellow)
            VStack {
                Button(action: {
                    self.handleAnswer(1)
                }) {
                    Text(quizs[currentQuizIndex].answer1)
                        .padding()
                        .foregroundColor(.white)
                }

                Button(action: {
                    self.handleAnswer(2)
                }) {
                    Text(quizs[currentQuizIndex].answer2)
                        .padding()
                        .foregroundColor(.white)
                }

                Button(action: {
                    self.handleAnswer(3)
                }) {
                    Text(quizs[currentQuizIndex].answer3)
                        .padding()
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(10)
            .padding()

            if isQuizComplete {
                Text("Score: \(numberOfGoodAnswers)")
                    .font(.headline)
                    .padding()

                Text(resultMessage)
                    .font(.title)
                    .foregroundColor(resultColor)
                    .padding()

                Button(action: {
                    self.resetQuiz()
                    self.showingResult = false
                }) {
                    Text("Restart Quiz")
                        .padding()
                }
            }
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
        .fullScreenCover(isPresented: $showingResult) {
            CoursListView() // Replace with your initial view
        }
    }

    var resultMessage: String {
        if numberOfGoodAnswers == 0 {
            return "Try again!"
        } else if numberOfGoodAnswers < quizs.count {
            return "Good!"
        } else {
            return "Congratulations!!!"
        }
    }

    var resultColor: Color {
        if numberOfGoodAnswers == 0 {
            return .red
        } else if numberOfGoodAnswers < quizs.count {
            return .green
        } else {
            return .yellow
        }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                handleAnswer(0)
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func resetQuiz() {
        numberOfGoodAnswers = 0
        currentQuizIndex = 0
        isQuizComplete = false
        remainingTime = 10
        startTimer()
    }

    func handleAnswer(_ answerID: Int) {
        guard !isQuizComplete else {
            return
        }

        let quiz = quizs[currentQuizIndex]
        if quiz.isCorrect(answerNumber: answerID) {
            numberOfGoodAnswers += 1
        }

        currentQuizIndex += 1
        if currentQuizIndex >= quizs.count {
            isQuizComplete = true
            stopTimer()
            showingResult = true
        } else {
            remainingTime = 10
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
