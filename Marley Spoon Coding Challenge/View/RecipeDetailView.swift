//
//  RecipeDetailView.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 23/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import SwiftUI
import Combine

struct RecipeDetailView: View {
  let viewModel: RecipeDetailViewModel
  var body: some View {
    
    VStack {
      ImageView(withURL: viewModel.photoUrl, maxWidth: UIScreen.main.bounds.width, maxHeight: 300)
      
      Text(viewModel.title)
        .fontWeight(Font.Weight.semibold)
        .font(Font.system(size: 20))
        .padding()
      
      Text(viewModel.description)
        .fontWeight(Font.Weight.regular)
        .font(Font.system(size: 15))
        .padding()
      
      if !viewModel.chefName.isEmpty {
        Text("Created By: \(viewModel.chefName)")
          .fontWeight(Font.Weight.light)
          .font(Font.system(size: 14))
          .padding()
      }
      
      if viewModel.calories > 0 {
        Text("Calories: \(viewModel.calories)")
          .fontWeight(Font.Weight.light)
          .font(Font.system(size: 14))
          .padding()
      }
      
      HStack {
        if !viewModel.recipeTags.isEmpty {
          Text("Tags: ")
            .fontWeight(Font.Weight.regular)
            .font(Font.system(size: 14))
            .padding()
          
          ForEach(viewModel.recipeTags, id: \.self) { tagName in
            Text("\(tagName)")
              .fontWeight(Font.Weight.light)
              .font(Font.system(size: 14))
              .padding()
          }
        }
      }
      
      Spacer()
    }
    
  }
  
  init(recipeDetailViewModel: RecipeDetailViewModel) {
    self.viewModel = recipeDetailViewModel
  }
}

