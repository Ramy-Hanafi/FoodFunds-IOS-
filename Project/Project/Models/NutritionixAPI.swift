//
//  NutritionixAPI.swift
//  Project
//
//  Created by Ramy Hanafi on 3/21/21.
//

import Foundation

struct NutritionixOuterJSONResponse: Decodable {
    let hits: [NutritionixJsonResponse]
}

struct NutritionixJsonResponse: Decodable {
    let fields: FoodItemJSON
}

struct FoodItemJSON: Decodable {
    var item_id: String?
    var item_name: String?
    var brand_name: String?
    var nf_calories: Float
    var nf_serving_size_qty: Int64?
}
