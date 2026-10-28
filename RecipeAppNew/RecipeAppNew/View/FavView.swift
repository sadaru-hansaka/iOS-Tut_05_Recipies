//
//  FavView.swift
//  RecipeAppNew
//
//  Created by Sadaru Hansaka on 2026-10-28.
//

import SwiftUI
import SwiftData

struct FavView: View {
    @Environment(RecipeListViewModel.self) private var viewModel
    @Query private var favoriteRecipes: [FavoriteRecipe]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FavView()
}
