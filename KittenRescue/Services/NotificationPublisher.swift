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
    
    func sendNotification(title: String, subtitle: String, body: String, badge: Int?, delayInterval: Int?) {
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        notificationContent.body = body
        
        var delayTimeTrigger: UNTimeIntervalNotificationTrigger?
        
        if let delayInterval = delayInterval {
            delayTimeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delayInterval), repeats: true)
        }
        
        if let badge = badge {
            var currentBadgeCount = UIApplication.shared.applicationIconBadgeNumber
            currentBadgeCount += badge
            notificationContent.badge = NSNumber(integerLiteral: currentBadgeCount)
        }
        
        notificationContent.sound = UNNotificationSound.default
        
        UNUserNotificationCenter.current().delegate = self
        
        let request = UNNotificationRequest(identifier: "TestLocalNotification", content: notificationContent, trigger: delayTimeTrigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    
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
