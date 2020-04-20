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
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!

    var ageDelegate: QuestionnaireResultDelegate!
    
    var currentQuestion: Int = 0
    var selectionList: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeQuiz()
    }
    
    @IBAction func previousQuestion(_ sender: Any) {
        currentQuestion -= 1
        arePreviousAndSubmitButtonDisplayed()
        traverseQuestionnaire()
    }
    
    @IBAction func submitButton(_ sender: Any) {
        ageDelegate.calculatedAge(age: 10.0)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func choiceSelected(_ sender: UIButton) {
        
        if currentQuestion < QuestionList.shared.questionList.count{
            selectionList[currentQuestion] = sender.isEqual(choiceOneButton) ? 1 : 2
            currentQuestion += 1
            traverseQuestionnaire()
        }
        
    }
    
    func traverseQuestionnaire() {
        arePreviousAndSubmitButtonDisplayed()
        isChoiceSelected()
        if currentQuestion < QuestionList.shared.questionList.count {
            questionLabel.text = QuestionList.shared.questionList[currentQuestion].question
        }
    }
    
    func isChoiceSelected() {
        if currentQuestion < QuestionList.shared.questionList.count{
            if selectionList[currentQuestion] == 1 {
                choiceOneButton.tintColor = .green
                choiceTwoButton.tintColor = .blue
            } else if selectionList[currentQuestion] == 2{
                choiceOneButton.tintColor = .blue
                choiceTwoButton.tintColor = .green
            } else {
                choiceOneButton.tintColor = .blue
                choiceTwoButton.tintColor = .blue
            }
        }
    }
    
    func arePreviousAndSubmitButtonDisplayed() {
        previousQuestionButton.isHidden = currentQuestion > 0 ? false : true
        submitQuestionnaireButton.isHidden = currentQuestion == QuestionList.shared.questionList.count ? false : true
    }
    
    func initializeQuiz() {
        questionLabel.text = QuestionList.shared.questionList[0].question
        for _ in QuestionList.shared.questionList {
            selectionList.append(0)
        }
    }
}
