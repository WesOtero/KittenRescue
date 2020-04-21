//
//  NotificationScreenVC.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/20/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class NotificationScreenVC: UIViewController {

    
    @IBOutlet weak var notificationNameLabel: UILabel!
    
    var notification: Notifications!
    var kitten: Kitten!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNotificationScreen()
    }
    
    func setUpNotificationScreen() {
        kitten = KittenDataOperations.getKitten(kittenName: notification.kitten)
        notificationNameLabel.text = notification.title
        
    }
}
