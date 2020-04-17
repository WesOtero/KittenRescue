//
//  NotificationsDashboardVC.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/12/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class NotificationsDashboardVC: UIViewController {
    
    @IBOutlet weak var notificationTableView: UITableView!
    
    var notifications: [Notification] = [Notification(name: "Hello", requirement: "World", status: "None")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
    }
}

extension NotificationsDashboardVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationTableViewCell
        
        cell.notificationNameLabel.text = notifications[indexPath.row].name
        cell.notificationRequirementLabel.text = notifications[indexPath.row].requirement
        cell.notificationStatusLabel.text = notifications[indexPath.row].status
        
        return cell
    }
    
    
}
