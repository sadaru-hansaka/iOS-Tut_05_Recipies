//
//  RecipeLisViewModel.swift
//  RecipeAppNew
//
//  Created by Sadaru Hansaka on 2026-10-28.
//

import Foundation
import Observation
import SwiftUI
import SwiftData

@Observable
class RecipeListViewModel {
    
    init(context: ModelContext) {
        self.context = context
    }
    
    var recipes: [RecipeDTO] = []
    var isLoading = false
    
    private let context: ModelContext
    
    func addFavorite (id: Int, name: String, prepTimeMinutes: Int, cookTimeMinutes: Int, servings: Int, difficulty: Difficulty, cuisine: String, caloriesPerServing: Int, isFavorite: Bool = true, image: String?)
    {
        let recipe = FavoriteRecipe(id: id, name: name, prepTimeMinutes: prepTimeMinutes, cookTimeMinutes: cookTimeMinutes, servings: servings, difficulty: difficulty, cuisine: cuisine, caloriesPerServing: caloriesPerServing, isFavorite: isFavorite, image: image)
        
        context.insert(recipe)
    }
    
    func deleteFavorite(_ recipe: FavoriteRecipe) {
        context.delete(recipe)
    }
    
    func fetchRecipes() async {
        
        guard let url = URL(string: "https://dummyjson.com/recipes") else {
            return
        }
        
        isLoading = true
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                isLoading = false
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                isLoading = false
                return
            }
            
            recipes = try JSONDecoder().decode([RecipeDTO].self, from: data)
            
           
        } catch {
            print("Something went wrong, please try again...")
        }
        
        isLoading = false
        
    }
}

//struct TestView: View {
//    @State private var viewModel = RecipeListViewModel()
//    @State private var recipes: [RecipeDTO] = []
//    
//    
//    var body: some View {
//        Group {
//            if recipes.isEmpty {
//                ProgressView()
//            } else {
//                List {
//                    ForEach(recipes) { recipe in
//                        VStack(alignment: .leading) {
//                            Text(recipe.name)
//                                .font(.title)
//                            Text(recipe.cuisine)
//                                .font(.caption)
//                        }
//                        
//                    }
//                }
//            }
//        }
//        .task {
//            await viewModel.fetchRecipes()
//        }
//    }
//}
//
//#Preview {
//    TestView()
//}
