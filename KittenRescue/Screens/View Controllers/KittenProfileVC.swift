//
//  KittenProfileVC.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/12/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class KittenProfileVC: UIViewController {
    
    @IBOutlet weak var kittenNameLabel: UILabel!
    @IBOutlet weak var kittenAgeLabel: UILabel!
    @IBOutlet weak var kittenSexLabel: UILabel!
    @IBOutlet weak var kittenWeightLabel: UILabel!
    @IBOutlet weak var kittenStatusLabel: UILabel!
    
    var kitten: Kitten = Kitten(name: "", age: 0, sex: "M", weight: 0.0, status: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKittenProfile()
    }
    
    func setupKittenProfile() {
        kittenNameLabel.text = kitten.name
        kittenAgeLabel.text = "Age: " + String(kitten.age)
        kittenSexLabel.text = "Sex: " + kitten.sex
        kittenWeightLabel.text = "Weight: " + String(kitten.weight)
        kittenStatusLabel.text = "Status: " + kitten.status
    }
}



