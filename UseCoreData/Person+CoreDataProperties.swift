//
//  Person+CoreDataProperties.swift
//  UseCoreData
//
//  Created by tembin on 2017/5/4.
//  Copyright © 2017年 YQ. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var uid: String?
    @NSManaged public var url: String?

}
