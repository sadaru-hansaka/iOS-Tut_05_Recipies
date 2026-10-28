//
//  RecipeDetailView.swift
//  RecipeAppNew
//
//  Created by Sadaru Hansaka on 2026-10-28.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(){
            HStack{
                RecipeBadge(imageURL: recipe.imageURL, size: 60)
                Text(recipe.name)

            }
            
            Text(recipe.cuisine)
        }
    }
}

//#Preview {
//    RecipeDetailView()
//}
