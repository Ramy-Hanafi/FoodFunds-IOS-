//
//  FoodItem+CoreDataProperties.swift
//  Project
//
//  Created by Ramy Hanafi on 4/7/21.
//
//

import Foundation
import CoreData


extension FoodItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodItem> {
        return NSFetchRequest<FoodItem>(entityName: "FoodItem")
    }

    @NSManaged public var brand: String?
    @NSManaged public var calories: Float
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var servSize: Int64
    @NSManaged public var price: Float

}

extension FoodItem : Identifiable {

}
