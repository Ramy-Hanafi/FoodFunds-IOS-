//
//  Purchases+CoreDataProperties.swift
//  Project
//
//  Created by Ramy Hanafi on 3/31/21.
//
//

import Foundation
import CoreData


extension Purchases {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Purchases> {
        return NSFetchRequest<Purchases>(entityName: "Purchases")
    }

    @NSManaged public var purchaseType: String?
    @NSManaged public var name: String?

}

extension Purchases : Identifiable {

}
