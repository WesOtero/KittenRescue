//
//  DataOperations.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/17/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit
import CoreData

class DataOperations {
    
    static func managedObjectContext() -> NSManagedObjectContext? {
        //refer the container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("AppDelegate not found!")
            return nil
        }
        
        //create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        return managedContext
    }
    
    static func getEntity(entityName: String) -> NSEntityDescription {
        let managedContext = managedObjectContext()
        
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext!)!
        
        return entity
    }
    
    static func getManagedObject(entityName: String) -> NSManagedObject {
        let managedContext = managedObjectContext()
        let entity = getEntity(entityName: entityName)
        let object = NSManagedObject(entity: entity, insertInto: managedContext)
        
        return object
    }
    
    static func saveData() {
        let managedContext = managedObjectContext()
        
        do {
            try managedContext!.save()
            
        } catch let error as NSError {
            print("Could not save the record. \(error), \(error.userInfo)")
        }
    }
}
