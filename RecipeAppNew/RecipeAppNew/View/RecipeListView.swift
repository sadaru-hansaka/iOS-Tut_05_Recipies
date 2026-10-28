//
//  RecipeListViewModel.swift
//  RecipeAppNew
//
//  Created by Sadaru Hansaka on 2026-10-28.
//

import SwiftUI
struct Recipe {
    let id: Int
    let name: String
    let cuisine: String
    let imageURL : String
    let rating: Double
}

struct RecipeListView: View {
    
    let recipes :[Recipe] = [
        Recipe(id: 1,name: "aefrgaerg", cuisine: "aergerg", imageURL: "https://cdn.dummyjson.com/recipe-images/1.webp", rating: 4.6),
        
        Recipe(id:2,name: "aefrgaerg", cuisine: "aergerg", imageURL: "https://cdn.dummyjson.com/recipe-images/1.webp", rating: 4.6),

        Recipe(id:3,name: "aefrgaerg", cuisine: "aergerg", imageURL: "https://cdn.dummyjson.com/recipe-images/1.webp", rating: 4.6)

    ]
    var body: some View {
        NavigationStack{
            List(recipes, id: \.id){recipe in
                NavigationLink(
                    destination: RecipeDetailView(recipe: recipe)
                ){
                    RecipeRowView(recipe: recipe)
                }
            }
            .navigationTitle("Recipies")
        }
    }
}

#Preview {
    RecipeListView()
}
