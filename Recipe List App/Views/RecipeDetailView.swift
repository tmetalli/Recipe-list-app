//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Tania Metalli on 18/03/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {

                // MARK: Recipe image
                Image(recipe.image).resizable().scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom,.top], 5)
                    
                    ForEach (recipe.ingredients) { ingredient in
                        Text("⋅ " + ingredient.name)
                            .padding(.bottom, 0.1)
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions").font(.headline).padding([.bottom,.top], 5)
                    
                    ForEach (0..<recipe.directions.count, id:\.self) {
                        index in
                        Text(String(index+1) + "⋅ " + recipe.directions[index]).padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create a dummy recipe and pass it to the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
