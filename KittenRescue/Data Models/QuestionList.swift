//
//  QuestionList.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/13/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

struct QuestionList {
    
    private init(){}
    
    static let shared = QuestionList()
    
    var questionList: [Question] = [
        Question(questionId: 1, question: "Is the umbilical cord attached?", userSelection: 0, answers: [
            "Yes",
            "No"
            ]
        ),
        Question(questionId: 2, question: "Are their eyes open?", userSelection: 0, answers: [
            "Yes",
            "No"
            ]
        ),
        Question(questionId: 3, question: "Is their eye color blue?", userSelection: 0, answers: [
            "Yes",
            "No"
            ]
        ),
        Question(questionId: 4, question: "Are their ears folded?", userSelection: 0, answers: [
            "Yes",
            "No"
            ]
        ),
        Question(questionId: 5, question: "Can they walk confidently?", userSelection: 0, answers: [
            "Yes",
            "No"
            ]
        ),
        Question(questionId: 6, question: "Are their premolars emerging?", userSelection: 0, answers: [
            "Yes",
            "No"
            ]
        ),
        Question(questionId: 7, question: "Have their canines and milk teeth fully emerged?", userSelection: 0, answers: [
            "Yes",
            "No"
            ]
        )
        
    ]
}
