//
//  Recipe.swift
//  Recipe List App
//
//  Created by Tania Metalli on 15/03/2023.
//

import Foundation

class Recipe: Identifiable, Decodable {
    // object recipe
    var id:UUID? // optional
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]

}
