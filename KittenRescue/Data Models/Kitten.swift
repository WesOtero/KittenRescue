//
//  Kitten.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/12/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

struct Kitten {
    
    var name: String
    var age: Float
    var sex: String
    var weight: Float
    var status: String
    
    private let notificationPublisher = NotificationPublisher()
    
    init(name: String, age: Float, sex: String, weight: Float, status: String) {
        self.name = name
        self.age = age
        self.sex = sex
        self.weight = weight
        self.status = status
        
        setHungerNotification()
        
    }
    
    mutating func setHungerNotification() {
        self.status = "Hungry"
        notificationPublisher.sendNotification(uniqueId: "\(name) Hunger Alert", title: "Hunger Alert", subtitle: "\(name) is hungry.", body: "Tap to see feeding details.", badge: 1, delayInterval: 60)
    }
}
