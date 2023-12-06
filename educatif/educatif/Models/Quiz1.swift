//
//  Quiz1.swift
//  educatif
//
//  Created by sarrabs on 5/12/2023.
//

import SwiftUI

struct Quiz1 {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var correctAnswerNumber: Int
    
    func isCorrect(answerNumber: Int) -> Bool {
        return answerNumber == correctAnswerNumber
    }
}
