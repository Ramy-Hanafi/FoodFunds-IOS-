//
//  WeightEntry+CoreDataProperties.swift
//  Project
//
//  Created by Brookie on 4/28/21.
//
//

import Foundation
import CoreData


extension WeightEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeightEntry> {
        return NSFetchRequest<WeightEntry>(entityName: "WeightEntry")
    }

    @NSManaged public var date: Date?
    @NSManaged public var weight: Float

}

extension WeightEntry : Identifiable {

}
