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
    @IBOutlet weak var kittenStatusLabel: UILabel!
    
    var kitten: Kitten = Kitten(name: "", age: 0, sex: "M", weight: 0.0, status: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKittenProfile()
    }
    
    func setupKittenProfile() {
        kittenNameLabel.text = kitten.name
        kittenAgeLabel.text = String(kitten.age)
        kittenStatusLabel.text = kitten.status
    }
}



