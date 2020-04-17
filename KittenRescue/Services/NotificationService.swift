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
    
    
}
