//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Tania Metalli on 01/04/2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailedViewShowing = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
        
        GeometryReader { geo in
            
            TabView {
                
                // Loop through each recipe
                ForEach (0..<model.recipes.count) { index in
                    
                    // Only show those that should be featured
                    if model.recipes[index].featured {
                        
                        // Recipe card button
                        Button(action: {
                            
                            // Show the recipe detailed sheet
                            self.isDetailedViewShowing = true
                        }, label: {
                            // Recipe card
                            ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                
                            VStack(spacing: 0) {
                                Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .clipped()
                                Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            
                            }
                            
                        })
                        .sheet(isPresented: $isDetailedViewShowing) {
                            // Show the recipe detail view
                            RecipeDetailView(recipe: model.recipes[index])
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 40, height: geo.size.height - /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                    }
                    
                }
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
            
            VStack(alignment: .leading, spacing: 10) {
            
            Text("Preparation Time")
            Text("1 hour")
            Text("Highlights")
            Text("Healthy, Hearty")
                
        }
            .padding([.leading, .bottom])
            
        }

    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
