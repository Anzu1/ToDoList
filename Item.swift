//
//  Item.swift
//  ToDoList
//
//  Created by appcamp on 7/25/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {

    @NSManaged var details: String
    @NSManaged var name: String

}
