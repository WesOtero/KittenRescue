//
//  NotificationService.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/13/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//
import UIKit
import UserNotifications

class NotificationService {
    
    let center = UNUserNotificationCenter.current()
    
    private init () {
        
    }
    
    static let shared = NotificationService()
    
    // Step 1: Ask for user permission
    func requestNotificationPriviledges() {
        center.requestAuthorization(options: [.alert,.badge, .sound]) { (granted, error) in
            if granted {
                // Any additional configurations if granted
            } else {
                // Any additional configurations if not granted
            }
        }
    }
    
    func configureNotification() {
    
    // Strep 2: Create Notification Content
        let content = UNMutableNotificationContent()
        content.title = "TITLE"
        content.body = "Look at this sexy body"
        content.sound = UNNotificationSound.default
    
    //Step 3: Create trigger
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            //Error handling here
        }
    }
    
}
