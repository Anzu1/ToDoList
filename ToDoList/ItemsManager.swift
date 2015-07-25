//
//  ItemsManager.swift
//  ToDoList
//
//  Created by appcamp on 7/19/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import UIKit
import CoreData

var itemsMgr: ItemsManager = ItemsManager()


class ItemsManager: NSObject {
    
    func addItem(name: String, details: String) {
        //items.append(item(name: name, details:  details))
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let manageContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: manageContext)
        let itemMO = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: manageContext)
     
        itemMO.setValue(name, forKey: "name")
        itemMO.setValue(details, forKey: "details")
        
        var error: NSError?
        
        if !manageContext.save(&error)
        {
            println("Could not save! \(error) \(error?.userInfo)")
        }
    }
    
    func deleteItem(item: NSManagedObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let manageContext = appDelegate.managedObjectContext!
        manageContext.deleteObject(item)
        
        var error: NSError?
        
        if(manageContext.save(&error)==false) {
            println("Could not save!\(error) \(error?.userInfo)")
        }
    }
}