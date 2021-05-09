//
//  FoodInfoModel.swift
//  Project
//
//  Created by Ramy Hanafi on 3/19/21.
//

import Foundation
import CoreData
import UIKit

/*class FoodInfoModel{
    public var localArrayOfFoods = Array<FoodItem>()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    public lazy var context = appDelegate.persistentContainer.viewContext
    
    public var totalSpent: Float = 0.0
    let defaults = UserDefaults.standard
    var balance: Float = 0.0

    
    public func createURL(searchTerm:String, price: Float?)->URL? {
        print("creating URL")
        let baseURL = "https://api.nutritionix.com/v1_1/search/\(searchTerm)?results=0:1&fields=item_name,brand_name,item_id,nf_calories&appId=\(GlobalConstants.APIKey.nutritionixAPPid)&appKey=\(GlobalConstants.APIKey.nutritionixAPIKey)"
        let urlComponents = URLComponents(string: baseURL)
        
        let url = urlComponents?.url
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue(GlobalConstants.APIKey.nutritionixAPPid, forHTTPHeaderField: "x-app-id")
        request.setValue(GlobalConstants.APIKey.nutritionixAPIKey, forHTTPHeaderField: "x-app-key")
        
        getCalories(url: url!, price: price )
        
        
        print("The URL is \(baseURL)")
        return url
    }
    
    public func getCalories(url: URL, price: Float?) {
        print ("The passed url is \(url)")
        print("In \(#function) (A)")
        let session = URLSession(configuration: .ephemeral)
        let task = session.dataTask(with: url){
                                        (data, response, error) in
                                            print("In the completion handler (B)")
            if let actualError = error{
                print("Got an error")
            }else if let actualData = data {
                print("In the completion handler, No errors. Got \(actualData)")
                let foodItems: NutritionixOuterJSONResponse = try!
                    JSONDecoder().decode(NutritionixOuterJSONResponse.self, from: actualData)
                print("parsed the json we got \(foodItems.hits.count)")
                for foodItem in foodItems.hits {
                    let idString = foodItem.fields.item_id
                    let name = foodItem.fields.item_name
                    let brand = foodItem.fields.brand_name
                    let cals = foodItem.fields.nf_calories
                    let servSize = foodItem.fields.nf_serving_size_qty
                    
                    print("id: \(idString)")
                    print("Name: \(name)")
                    print("calories: \(cals)")
                    let thisItem = FoodItem(context: self.context)
                    thisItem.id = idString
                    thisItem.name = name
                    thisItem.brand = brand
                    thisItem.calories = cals
                    thisItem.servSize = servSize!
                    thisItem.price = price ?? 0.0
                    self.localArrayOfFoods.append(thisItem)
                    //save item
                    do{
                        try self.context.save()
                    }catch {
                        
                    }
                    
                }
                
                print ("Food items processed \(self.localArrayOfFoods.count)")
            }
                                        }
                                    
        
        task.resume()
        print("Task has started")
      
    }
    
    public func getItemNameAt(item: Int)->String {
        return localArrayOfFoods[item].name!
    }
    
    public func getItemCalsAt(item: Int)-> Float {
        return localArrayOfFoods[item].calories
    }
    
    public func getNumOfItems()->Int{
        return localArrayOfFoods.count
    }
    
    public func getTotalSpent()->Float{
        for foods in localArrayOfFoods{
            totalSpent = totalSpent + foods.price
        }
        return totalSpent
    }
    
    public func setBalance(amount: Float){
        balance = amount
        defaults.set(balance, forKey: "Balance")
    }
    
    public func getBalance()->Float{
        return defaults.float(forKey: "Balance")
    }
}
*/
