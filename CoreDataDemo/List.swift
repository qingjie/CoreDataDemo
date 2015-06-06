//
//  List.swift
//  CoreDataDemo
//
//  Created by qingjiezhao on 6/5/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import Foundation
import CoreData
@objc(List)
class List: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var note: String
    @NSManaged var qty: String

}