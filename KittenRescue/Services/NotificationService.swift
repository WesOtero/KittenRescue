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
    let notificationPublisher = NotificationPublisher()
    
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
    
    func setKittenNotifications(kitten: Kitten) {
        setKittenHungerNotification(kitten: kitten)
    }
    
    func setKittenHungerNotification(kitten: Kitten) {
        let notificationId = "\(kitten.name)_Hungry"
        let title = "\(kitten.name) is Hungry"
        let subtitle = ""
        let body = "Tap to see feeding details."
    
        notificationPublisher.sendNotification(uniqueId: notificationId, title: title, subtitle: subtitle, body: body, badge: 1, delayInterval: 60, repeats: true)
        
        saveNotification(uniqueId: notificationId, title: title, message: body, status: "Hungry", kitten: kitten.name)
    }
    
    func saveNotification(uniqueId: String, title: String, message: String, status: String, kitten: String) {
        NotificationsDataOperations.addNotification(id: uniqueId, title: title, message: message, status: status, kitten: kitten)
    }
}
