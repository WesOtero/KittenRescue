//
//  AgeCalculationService.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/20/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import Foundation

class AgeCalculationService {
    
    static func calculateKittenAge(question: Question) -> Float {
        
        var result: Float = 0.0
        
        switch question.questionId {
        case 1:
            if question.userSelection == 1 {
                result = 0.0 // 0
            }
        case 2:
            if question.userSelection == 2 {
                result = 1.0 // 1
            }
        case 3:
            if question.userSelection == 2 {
                result = 8.0 // 8
            }
        case 4:
            if question.userSelection == 1 {
                result = 2.0 // 2
            }
        case 5:
            if question.userSelection == 2 {
                result = 3.0 // 3
            }
        case 6:
            if question.userSelection == 2 {
                result = 4.0 // 4
            }
        case 7:
            if question.userSelection == 2 {
                result = 5.0 // 5
            } else {
                result = 6.0
            }
        default:
            print("Error")
        }
        
        return result
    }
    
    static func isQuestionnaireComplete (question: Question) -> Bool {
        var isQuizCompleted = false
        
        switch question.questionId {
        case 1:
            if question.userSelection == 1 {
                isQuizCompleted = true // 0
            }
        case 2:
            if question.userSelection == 2 {
                isQuizCompleted = true // 1
            }
        case 3:
            if question.userSelection == 2 {
                isQuizCompleted = true // 8
            }
        case 4:
            if question.userSelection == 1 {
                isQuizCompleted = true // 2
            }
        case 5:
            if question.userSelection == 2 {
                isQuizCompleted = true // 3
            }
        case 6:
            if question.userSelection == 2 {
                isQuizCompleted = true 
            }
        case 7:
            if question.userSelection == 2 {
                isQuizCompleted = true // 5
            } else {
                isQuizCompleted = true
            }
        default:
            print("Error")
        }
        print(isQuizCompleted)
        return isQuizCompleted
    }
    
}
