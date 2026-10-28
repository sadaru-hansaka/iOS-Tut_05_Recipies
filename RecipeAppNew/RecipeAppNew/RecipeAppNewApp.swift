//
//  RecipeAppNewApp.swift
//  RecipeAppNew
//
//  Created by Sadaru Hansaka on 2026-10-28.
//

import SwiftUI
import SwiftData

@main
struct RecipeAppNewApp: App {
    private let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: FavoriteRecipe.self)
        } catch {
            fatalError("Could not create database connection...")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
