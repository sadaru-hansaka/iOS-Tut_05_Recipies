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
    @State private var viewModel: RecipeListViewModel
    
    init() {
        do {
            container = try ModelContainer(for: FavoriteRecipe.self)
            _viewModel = State(initialValue: RecipeListViewModel(context: container.mainContext))
        } catch {
            fatalError("Could not create database connection...")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
        .modelContainer(container)
    }
}
