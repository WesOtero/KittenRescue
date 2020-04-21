//
//  NotificationsDashboardVC.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/12/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

let newNotificationAppNotificationkey = "net.wesleyotero.newNotification"

class NotificationsDashboardVC: UIViewController {
    
    let newAppNotification = Notification.Name(rawValue: newNotificationAppNotificationkey)
    
    @IBOutlet weak var notificationTableView: UITableView!
    
    var notifications: [Notifications] = NotificationsDataOperations.getAllNotifications()
    
    var appNotificationAdded = false
    var indexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        createObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        notifications = NotificationsDataOperations.getAllNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if appNotificationAdded {
            notificationTableView.beginUpdates()
            indexPath = IndexPath(row: notifications.count - 1 , section: 0)
            notificationTableView.insertRows(at: [indexPath], with: .automatic)
            notificationTableView.endUpdates()
            appNotificationAdded = false
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(NotificationsDashboardVC.updateAppNotificationList(notification:)), name: newAppNotification, object: nil)
    }
    
    @objc func updateAppNotificationList(notification: NSNotification) {
        appNotificationAdded = true
    }
}

extension NotificationsDashboardVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationTableViewCell        
        cell.notificationNameLabel.text = notifications[indexPath.row].title
        cell.notificationRequirementLabel.text = notifications[indexPath.row].message
        cell.notificationStatusLabel.text = notifications[indexPath.row].status
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Heyy")
        let indexPath = tableView.indexPathForSelectedRow!
        let notificationScreenVC = storyboard?.instantiateViewController(identifier: "Notification") as! NotificationScreenVC
        notificationScreenVC.notification = notifications[indexPath.row]
        
        present(notificationScreenVC, animated: true, completion: nil)
    }
    
    
}
