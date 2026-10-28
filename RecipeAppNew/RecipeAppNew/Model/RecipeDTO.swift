//
//  RecipeDTO.swift
//  RecipeApp
//
//  Created by Manazir Ali on 2026-10-28.
//
import Foundation

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

struct RecipeDTO: Codable, Identifiable {
    let id: Int
    let name: String
    let ingredients: [String]
    let instructions: [String]
    let prepTimeMinutes: Int
    let cookTimeMinutes: Int
    let serving: Int
    let image: String
    let cuisine: String
    let difficulty: Difficulty
    let rating: Double
}

