//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Tania Metalli on 18/03/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {

                // MARK: Recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                // MARK: Serving Size Picker
                VStack (alignment: .leading) {
                Text("Select your serving size")
                Picker("", selection: $selectedServingSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)

                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width:160)
                }
                .padding()
                
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom,.top], 5)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("⋅ " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
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
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create a dummy recipe and pass it to the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
