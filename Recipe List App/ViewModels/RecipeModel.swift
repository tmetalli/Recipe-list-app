//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Tania Metalli on 15/03/2023.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // Get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                // Calculated whole portions
                wholePortions = numerator / denominator
                
                // Calculate the remainder
                numerator = numerator % denominator
                
                // Assign to portion string
                portion += String(wholePortions)
            }
            
            // Express the remainder as a fraction
            if numerator > 0 {
                
                // Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        return String(targetServings)
        
    }

}
