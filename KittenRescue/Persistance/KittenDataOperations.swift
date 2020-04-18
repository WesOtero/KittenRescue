//
//  KittenDataOperations.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/17/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit
import CoreData

class KittenDataOperations {
    
    static var kittenList: [Kitten] = []
    
    static func addKitten(name: String, age: Float, sex: String, status: String) {
        let managedObject = DataOperations.getManagedObject(entityName: "KittenModel")
        managedObject.setValue(name, forKey: "name")
        managedObject.setValue(age, forKey: "age")
        managedObject.setValue(sex, forKey: "sex")
        managedObject.setValue(status, forKey: "status")
        kittenList.append(Kitten(name: name, age: age, sex: sex, weight: 10.0, status: status))
        DataOperations.saveData()
        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
        print(KittenDataOperations.kittenList)
        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
    }
    
    func getKitten() {
        
    }
    
    static func getAllKittens() -> [Kitten] {
        let managedObject = DataOperations.managedObjectContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "KittenModel")
        var kittens: [Kitten] = []
        do {
            
            let result = try managedObject?.fetch(fetchRequest)
            
            for data in result as! [NSManagedObject] {
                let name = data.value(forKey: "name") as! String
                let age = data.value(forKey: "age") as! Float
                let status = data.value(forKey: "status") as! String
                let sex = data.value(forKey: "sex") as! String
                
                let kittenObject = Kitten(name: name, age: age, sex: sex, weight: 10.0, status: status)
                
                kittens.append(kittenObject)
            }
            
            
            
        } catch {
            print("Unable to fetch Kitten Data.")
        }
        
        return kittens
    }
    
    func editKitten() {
        
    }
    
    func deleteKitten() {
        
    }
    
}
