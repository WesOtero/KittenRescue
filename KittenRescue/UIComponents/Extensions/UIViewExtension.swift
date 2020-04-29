//
//  UIViewExtension.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/28/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

extension UIView {
    
    func appear() {
        let appear = CABasicAnimation(keyPath: "opacity")
        appear.duration = 0.5
        appear.fromValue = 0.0
        appear.toValue = 1.0
        
        layer.add(appear, forKey: nil)
    }
    
    func reappear() {
        let appear = CABasicAnimation(keyPath: "opacity")
        appear.duration = 0.5
        appear.fromValue = 1.0
        appear.toValue = 0.0
        appear.autoreverses = true
        
        layer.add(appear, forKey: nil)
    }
    
    func disappearleft() {
        let appear = CABasicAnimation(keyPath: "opacity")
        appear.duration = 0.5
        appear.fromValue = 1.0
        appear.toValue = 0.0
        appear.autoreverses = true
        let moveLeft = CABasicAnimation(keyPath: "position")
        moveLeft.duration = 0.5
        
        let toPoint = CGPoint(x: center.x - 10, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        moveLeft.toValue = toValue
        
        layer.add(moveLeft, forKey: nil)
        layer.add(appear, forKey: nil)
    }
}
