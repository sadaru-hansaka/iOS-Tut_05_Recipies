//
//  RecipeLisViewModel.swift
//  RecipeAppNew
//
//  Created by Sadaru Hansaka on 2026-10-28.
//

import Observation
import SwiftData

@Observable
final class RecipeListViewModel {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addFavorite (id: Int, name: String, prepTimeMinutes: Int, cookTimeMinutes: Int, servings: Int, difficulty: Difficulty, cuisine: String, caloriesPerServing: Int, image: String?)
    {
        let recipe = FavoriteRecipe(id: id, name: name, prepTimeMinutes: prepTimeMinutes, cookTimeMinutes: cookTimeMinutes, servings: servings, difficulty: difficulty, cuisine: cuisine, caloriesPerServing: caloriesPerServing, image: image)
        
        context.insert(recipe)
    }
    
    func deleteFavorite(_ recipe: FavoriteRecipe) {
        context.delete(recipe)
    }
}
