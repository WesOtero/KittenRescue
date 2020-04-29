//
//  QuestionnaireVC.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/13/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

protocol QuestionnaireResultDelegate {
    func calculatedAge(age: Float)
}

class QuestionnaireVC: UIViewController {
    
    @IBOutlet weak var previousQuestionButton: UIButton!
    @IBOutlet weak var submitQuestionnaireButton: UIButton!
    
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var choiceOneButton: KRButton!
    @IBOutlet weak var choiceTwoButton: KRButton!
    
    var ageDelegate: QuestionnaireResultDelegate!
    
    var kittenAge: Float = 0.0
    var isQuestionnaireCompleted = false
    var questionIndex: Int = 0
    var selectionList: [Int] = []
    var questionList: [Question] = QuestionList.shared.questionList
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeQuiz()
    }
    
    @IBAction func previousQuestion(_ sender: Any) {
        if isQuestionnaireCompleted {
            initializeQuiz()
        } else {
            questionIndex -= 1
            arePreviousAndSubmitButtonDisplayed()
            traverseQuestionnaire()
            
        }
    }
    
    @IBAction func submitButton(_ sender: Any) {
        ageDelegate.calculatedAge(age: kittenAge)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func choiceSelected(_ sender: KRButton) {
        if questionIndex < questionList.count {
            let userChoice = sender.isEqual(choiceOneButton) ? 1 : 2
            selectionList[questionIndex] = userChoice
            questionList[questionIndex].userSelection = userChoice
            isQuestionnaireCompleted = AgeCalculationService.isQuestionnaireComplete(question: questionList[questionIndex])
            if isQuestionnaireCompleted {
                endQuiz()
            } else {
                questionIndex += 1
                traverseQuestionnaire()
            }
        }
    }
    
    func traverseQuestionnaire() {
        isChoiceSelected()
        arePreviousAndSubmitButtonDisplayed()
        if questionIndex < questionList.count {
            questionLabel.text = questionList[questionIndex].question
        }
    }
    
    func isChoiceSelected() {
        questionLabel.appear()
        questionImageView.appear()
        choiceOneButton.appear()
        choiceTwoButton.appear()
        if questionIndex < questionList.count{
            if selectionList[questionIndex] == 1 {
                choiceOneButton.tintColor = .white
                choiceOneButton.backgroundColor = .systemGreen
                choiceOneButton.appear()
                choiceTwoButton.tintColor = .blue
                choiceTwoButton.backgroundColor = .clear
                questionList[questionIndex].userSelection = 1
            } else if selectionList[questionIndex] == 2{
                choiceOneButton.tintColor = .blue
                choiceOneButton.backgroundColor = .clear
                choiceTwoButton.tintColor = .white
                choiceTwoButton.backgroundColor = .systemGreen
                choiceTwoButton.appear()
                questionList[questionIndex].userSelection = 2
            } else {
                choiceOneButton.tintColor = .blue
                choiceTwoButton.tintColor = .blue
                questionList[questionIndex].userSelection = 0
            }
        }
    }
    
    func arePreviousAndSubmitButtonDisplayed() {
        previousQuestionButton.isHidden = questionIndex > 0 ? false : true
        submitQuestionnaireButton.isHidden = isQuestionnaireCompleted
    }
    
    func initializeQuiz() {
        choiceOneButton.isHidden = false
        choiceTwoButton.isHidden = false
        submitQuestionnaireButton.isHidden = true
        previousQuestionButton.isHidden = true
        previousQuestionButton.setTitle("Previous", for: .normal)
        questionLabel.text = questionList[0].question
        questionIndex = 0
        selectionList.removeAll()
        for _ in questionList {
            selectionList.append(0)
        }
    }
    
    func endQuiz() {
        previousQuestionButton.setTitle("Restart", for: .normal)
        previousQuestionButton.appear()
        choiceOneButton.isHidden = true
        choiceTwoButton.isHidden = true
        submitQuestionnaireButton.isHidden = false
        previousQuestionButton.isHidden = false
        kittenAge = AgeCalculationService.calculateKittenAge(question: questionList[questionIndex])
        questionLabel.text = "Your kitten is \(kittenAge) weeks old."
    }
    
    func animateButton(button: KRButton) {
        button.backgroundColor = .systemGreen
        button.appear()
    }
}
