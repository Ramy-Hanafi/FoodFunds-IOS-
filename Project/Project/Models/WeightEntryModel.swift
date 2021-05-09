//
//  WeightEntryModel.swift
//  Project
//
//  Created by Ramy Hanafi on 4/2/21.
//

import Foundation
import CoreData
import UIKit

class WeightEntryModel{
    public var listOfWeightEntries = Array<WeightEntry>()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    public lazy var context = appDelegate.persistentContainer.viewContext
    
    public func addEntry(enteredWeight:Float, theDate: Date){
        let entry = WeightEntry(context: self.context)
        entry.weight = enteredWeight
        entry.date = theDate
        self.listOfWeightEntries.append(entry)
        
        do{
            try self.context.save()
        }catch {
            
        }
    }
    
    public func getWeightAt(entry: Int)->Float{
        return listOfWeightEntries[entry].weight
    }
    
    public func getDateOfEntry(entry: Int)->Date{
        return listOfWeightEntries[entry].date!
    }
    
    public func getNumOfItems()->Int{
        return listOfWeightEntries.count
    }
}
