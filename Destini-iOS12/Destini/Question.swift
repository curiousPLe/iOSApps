//
//  Question.swift
//  Destini
//
//  Created by Dung Le on 6/30/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
class Question {
    let question : String
    let answerA : String
    let answerB : String
    
    init (_ questionText : String, _ answerAText : String, _ answerBText : String) {
        question = questionText
        answerA = answerAText
        answerB = answerBText
    }
}
