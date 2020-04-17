//
//  MainVC.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/16/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationService.shared.requestNotificationPriviledges()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
