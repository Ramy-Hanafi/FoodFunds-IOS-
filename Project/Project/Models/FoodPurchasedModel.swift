//
//  FoodPurchasedModel.swift
//  Project
//
//  Created by Ramy Hanafi on 3/18/21.
//

import Foundation
import CoreData
import UIKit

class FoodPurchasedModel{
    public var listOfPurchases = Array<Purchases>()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    public lazy var context = appDelegate.persistentContainer.viewContext
    
    public func addPurchase(storeName: String?, purchaseType: String?){
        let purchase = Purchases(context: self.context)
        purchase.name = storeName
        purchase.purchaseType = purchaseType
        self.listOfPurchases.append(purchase)
        
        do{
            try self.context.save()
        }catch {
            
        }
    }
    
    public func getNumOfItems()->Int{
        return listOfPurchases.count
    }
    
}
