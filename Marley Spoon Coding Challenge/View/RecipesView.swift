//
//  RecipesView.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 22/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import SwiftUI
import Combine

struct RecipesView: View {
  @ObservedObject var viewModel: RecipesViewModel
  
  var body: some View {
    NavigationView {
      if viewModel.errorString.isEmpty {
        List(viewModel.recipes) { recipe in
          ZStack {
            CardView(recipe: recipe)
            NavigationLink(destination: self.getRecipeDetailView(tappedRecipe: recipe)) {
              EmptyView()
            }.buttonStyle(PlainButtonStyle())
          }.navigationBarTitle("Recipes")
        }
      } else {
        Text(viewModel.errorString)
      }
    }
    .onAppear {
      self.viewModel.fetchRecipes()
    }
  }
  
  init(viewModel: RecipesViewModel) {
    self.viewModel = viewModel
    UITableView.appearance().separatorStyle = .none
  }
  
  func getRecipeDetailView(tappedRecipe: Recipe) -> RecipeDetailView {
    let recipeDetailViewModel = RecipeDetailViewModel(recipe: tappedRecipe)
    let recipeDetailView = RecipeDetailView(recipeDetailViewModel: recipeDetailViewModel)
    return recipeDetailView
  }
}

