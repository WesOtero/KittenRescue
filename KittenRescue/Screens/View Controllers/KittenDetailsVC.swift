//
//  KittenDetailsVC.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/15/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class KittenDetailsVC: UIViewController {
    
    @IBOutlet weak var kittenImageView: UIImageView!
    @IBOutlet weak var kittenNameTextField: UITextField!
    @IBOutlet weak var kittenAgeTextField: UITextField!
    @IBOutlet weak var kittenSexTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func beginQuestionnaire(_ sender: Any) {
        let questionnaireScreen = storyboard?.instantiateViewController(identifier: "Questionnaire") as! QuestionnaireVC
        questionnaireScreen.ageDelegate = self
        present(questionnaireScreen, animated: true, completion: nil)
    }
    
    @IBAction func registerkitten(_ sender: Any) {
        KittenDataOperations.addKitten(name: kittenNameTextField.text!, age: 10.0, sex: "NIL", status: "NIL")
        let update = Notification.Name(rawValue: newKittenNotificationKey)
        NotificationCenter.default.post(name: update, object: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func configureTextFields() {
        kittenNameTextField.delegate = self
        kittenAgeTextField.delegate = self
        kittenSexTextField.delegate = self
    }
}

extension KittenDetailsVC: QuestionnaireResultDelegate, UITextFieldDelegate {
    
    func calculatedAge(age: Float) {
        kittenAgeTextField.text = String(age)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
