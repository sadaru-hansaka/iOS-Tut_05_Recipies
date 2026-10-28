//
//  RecipeRowView.swift
//  RecipeAppNew
//
//  Created by Sadaru Hansaka on 2026-10-28.
//

/*
 {
       "id": 1,
       "name": "Classic Margherita Pizza",
       "ingredients": [
         "Pizza dough",
         "Tomato sauce",
         "Fresh mozzarella cheese",
         "Fresh basil leaves",
         "Olive oil",
         "Salt and pepper to taste"
       ],
       "instructions": [
         "Preheat the oven to 475°F (245°C).",
         "Roll out the pizza dough and spread tomato sauce evenly.",
         "Top with slices of fresh mozzarella and fresh basil leaves.",
         "Drizzle with olive oil and season with salt and pepper.",
         "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.",
         "Slice and serve hot."
       ],
       "prepTimeMinutes": 20,
       "cookTimeMinutes": 15,
       "servings": 4,
       "difficulty": "Easy",
       "cuisine": "Italian",
       "caloriesPerServing": 300,
       "tags": [
         "Pizza",
         "Italian"
       ],
       "userId": 166,
       "image": "https://cdn.dummyjson.com/recipe-images/1.webp",
       "rating": 4.6,
       "reviewCount": 98,
       "mealType": [
         "Dinner"
       ]
     },
 */

import SwiftUI

struct RecipeBadge: View {
    let imageURL: String
    let size: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            RoundedRectangle(cornerRadius: size * 0.25)
                .fill(Color.gray.opacity(0.15))
                .overlay {
                    Image(systemName: "fork.knife")
                        .foregroundStyle(.secondary)
                }
        }
        .frame(width: size, height: size)
        .clipShape(
            RoundedRectangle(cornerRadius: size * 0.25)
        )
    }
}


struct RecipeRowView: View {
    
    let recipe: Recipe

    
    var body: some View {
        HStack{
            RecipeBadge(imageURL: recipe.imageURL,size: 80)
            VStack(alignment: .leading){
                Text(recipe.name)
                    .font(.title2)
                Text(recipe.cuisine)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            Spacer()
            HStack{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(recipe.rating, specifier: "%.1f")")
                    .font(.title3)
            }
        }
        .padding()
    }
}

//#Preview {
//    RecipeRowView()
//}
