//
//  NotificationPublisher.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/16/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationPublisher: NSObject {
    
    func sendNotification(uniqueId: String, title: String, subtitle: String, body: String, badge: Int?, delayInterval: Int?, repeats: Bool) {
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        notificationContent.body = body
        
//        saveNotification(uniqueId: uniqueId, title: title, message: body, status: "Pending")
//
        var delayTimeTrigger: UNTimeIntervalNotificationTrigger?
        
        if let delayInterval = delayInterval {
            delayTimeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delayInterval), repeats: repeats)
        }
        
        if let badge = badge {
            var currentBadgeCount = UIApplication.shared.applicationIconBadgeNumber
            currentBadgeCount += 1
            notificationContent.badge = NSNumber(integerLiteral: currentBadgeCount)
        }
        
        notificationContent.sound = UNNotificationSound.default
        
        UNUserNotificationCenter.current().delegate = self
        
        let request = UNNotificationRequest(identifier: uniqueId, content: notificationContent, trigger: delayTimeTrigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func dismissNotification(notificationId: String) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [notificationId])
    }
    
//    func saveNotification(uniqueId: String, title: String, message: String, status: String, kitten: String) {
//        NotificationsDataOperations.addNotification(id: uniqueId, title: title, message: message, status: status, kitten: kitten)
//    }
}

extension NotificationPublisher: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Here I can add in app actions")
        completionHandler([.badge, .sound, .alert])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let identifier = response.actionIdentifier
        
        switch identifier {
        case UNNotificationDismissActionIdentifier:
            print("Notification was dismissed.")
            completionHandler()
        case UNNotificationDefaultActionIdentifier:
            print("User Opened the app")
            completionHandler()
        default:
            print("Default switch statemtn case.")
            completionHandler()
        }
    }
}
