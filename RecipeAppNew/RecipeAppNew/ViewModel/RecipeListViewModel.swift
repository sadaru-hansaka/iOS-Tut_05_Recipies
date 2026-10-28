//
//  RecipeLisViewModel.swift
//  RecipeAppNew
//
//  Created by Manazir Ali on 2026-10-28.
//

import Foundation
import Observation

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
            
            let decoded = try JSONDecoder().decode(RecipeResponse.self, from: data)
            self.recipes = decoded.recipes.sorted { $0.name < $1.name }

        } catch {
            print("Detailed Error: \(error)")
        }
        
        isLoading = false
    }
}

import SwiftUI

struct TestView: View {
    @State private var viewModel = RecipeListViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.recipes) { recipe in
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
            .navigationTitle("Recipe List ")
            .task {
                await viewModel.fetchRecipes()
            }
        }
    }
}

#Preview {
    TestView()
}
