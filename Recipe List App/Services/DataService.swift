//
//  DataService.swift
//  Recipe List App
//
//  Created by Tania Metalli on 15/03/2023.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] { // adding static kw turns this method into a static method or a type method, like a data type method. The method can be called directly and not having to call an instance
        
        // parse local json file
        
        // get a url path to the json file (1
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
         
        //check the data is not empty. Different ways to do that: if statement, optional binding
        // another method is a guard statement
        // check if pathstring is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create a data object
            let data = try Data(contentsOf: url)
            
            // decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // return the recipes
                return recipeData
                
            }
            catch {
                // error with parsing json
                print(error)
            }

        }
        catch {
            // error with getting data
            print(error)
        }
        
        // need to return something
        return [Recipe]()
    }
    
}
