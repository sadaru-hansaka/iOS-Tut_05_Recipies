//
//  Recipe.swift
//  RecipeAppNew
//
//  Created by Sadaru Hansaka on 2026-10-28.
//

import Foundation
import SwiftData
//
//enum Difficulty {
//    case easy
//    case medium
//    case hard
//}

@Model
final class FavoriteRecipe {
    var id: Int
    var name: String
    var prepTimeMinutes: Int
    var cookTimeMinutes: Int
    var servings: Int
    var difficulty: Difficulty
    var cuisine: String
    var caloriesPerServing: Int
    var isFavorite: Bool
    var image: String?
    
    init(id: Int, name: String, prepTimeMinutes: Int, cookTimeMinutes: Int, servings: Int, difficulty: Difficulty, cuisine: String, caloriesPerServing: Int, isFavorite: Bool = true, image: String?) {
        self.id = id
        self.name = name
        self.prepTimeMinutes = prepTimeMinutes
        self.cookTimeMinutes = cookTimeMinutes
        self.servings = servings
        self.difficulty = difficulty
        self.cuisine = cuisine
        self.caloriesPerServing = caloriesPerServing
        self.isFavorite = isFavorite
        self.image = image
    }
}
