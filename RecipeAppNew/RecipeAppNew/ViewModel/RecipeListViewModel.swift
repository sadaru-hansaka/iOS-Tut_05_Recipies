//
//  RecipeLisViewModel.swift
//  RecipeAppNew
//
//  Created by Sadaru Hansaka on 2026-10-28.
//

import Foundation
import Observation
import SwiftUI

@Observable
class RecipeListViewModel {
    
    var recipes: [RecipeDTO] = []
    var isLoading = false
    
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

struct TestView: View {
    @State private var viewModel = RecipeListViewModel()
    @State private var recipes: [RecipeDTO] = []
    
    
    var body: some View {
        Group {
            if recipes.isEmpty {
                ProgressView()
            } else {
                List {
                    ForEach(recipes) { recipe in
                        VStack(alignment: .leading) {
                            Text(recipe.name)
                                .font(.title)
                            Text(recipe.cuisine)
                                .font(.caption)
                        }
                        
                    }
                }
            }
        }
        .task {
            await viewModel.fetchRecipes()
        }
    }
}

#Preview {
    TestView()
}
