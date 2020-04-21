//
//  NotificationDataOperations.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/17/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit
import CoreData

class NotificationsDataOperations {
    
    static var notificationList: [Notifications] = []
    
    static func addNotification(id: String, title: String, message: String, status: String, kitten: String) {
        let managedObject = DataOperations.getManagedObject(entityName: "AppNotificationModel")
        managedObject.setValue(id, forKey: "id")
        managedObject.setValue(title, forKey: "title")
        managedObject.setValue(message, forKey: "message")
        managedObject.setValue(status, forKey: "status")
        managedObject.setValue(kitten, forKey: "kitten")
        notificationList.append(Notifications(id: id, title: title, message: message, status: status, kitten: kitten))
        DataOperations.saveData()
    }
    
    static func getAllNotifications() -> [Notifications] {
        let managedObject = DataOperations.managedObjectContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AppNotificationModel")
        
        var notifications: [Notifications] = []
        
        do {
             let result = try managedObject?.fetch(fetchRequest)
            
            for data in result as! [NSManagedObject] {
                let id = data.value(forKey: "id") as! String
                let title = data.value(forKey: "title") as! String
                let message = data.value(forKey: "message") as! String
                let status = data.value(forKey: "status") as! String
                let kitten = data.value(forKey: "kitten") as! String
                notifications.append(Notifications(id: id, title: title, message: message, status: status, kitten: kitten))
            }
            
        } catch {
            print("Unable to fetch notification data")
        }
        
        return notifications
    }
}
