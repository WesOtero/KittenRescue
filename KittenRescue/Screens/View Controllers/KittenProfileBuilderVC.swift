//
//  KittenDetailsVC.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/15/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class KittenProfileBuilderVC: UIViewController {
    
    @IBOutlet weak var kittenImageView: UIImageView!
    @IBOutlet weak var kittenNameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
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
        let name = kittenNameTextField.text!
        let weight = (weightTextField.text! as NSString).floatValue
        let age: Float = (kittenAgeTextField.text! as NSString).floatValue
        let sex = kittenSexTextField.text!
        
        KittenDataOperations.addKitten(name: name, weight: weight, age: age, sex: sex, status: "NIL")
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

extension KittenProfileBuilderVC: QuestionnaireResultDelegate, UITextFieldDelegate {
    
    func calculatedAge(age: Float) {
        kittenAgeTextField.text = String(age)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
