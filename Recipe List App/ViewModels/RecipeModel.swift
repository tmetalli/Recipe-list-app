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
        
        // create an instance of data service and get data
        // let service = DataService() ... simpliefied as:
        // self.recipes = DataService().getLocalData()
        self.recipes = DataService.getLocalData() // after adding the static kw we can call the method directly on the data type
        
    }
    
    
    
}
