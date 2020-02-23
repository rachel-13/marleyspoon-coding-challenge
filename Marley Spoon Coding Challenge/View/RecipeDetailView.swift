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
    VStack(alignment: .leading) {
      VStack(alignment: .center, spacing: 0) {
        ImageView(withURL: viewModel.photoUrl, maxWidth: UIScreen.main.bounds.width, maxHeight: 350)
        
        Text(viewModel.title)
          .fontWeight(Font.Weight.semibold)
          .font(Font.system(size: 20))
          .padding()
        
        Text(viewModel.description)
          .fontWeight(Font.Weight.regular)
          .font(Font.system(size: 15))
          .padding()
      }
      
      VStack(alignment: .leading, spacing: 0) {
        if !viewModel.chefName.isEmpty {
          Text("Created By: \(viewModel.chefName)")
            .fontWeight(Font.Weight.light)
            .font(Font.system(size: 14))
            .padding(.leading)
        }
        
        if viewModel.calories > 0 {
          Text("Calories: \(viewModel.calories)")
            .fontWeight(Font.Weight.light)
            .font(Font.system(size: 14))
            .padding([.leading, .top, .bottom])
        }
        
        if !viewModel.recipeTags.isEmpty {
          HStack(alignment: .lastTextBaseline, spacing: 0) {
            Text("Tags: ")
              .fontWeight(Font.Weight.regular)
              .font(Font.system(size: 14))
              .padding(.leading)
            
            ForEach(viewModel.recipeTags, id: \.self) { tagName in
              Button(action: {
                // do nothing
              }) {
                Text("\(tagName) ")
                  .fontWeight(Font.Weight.light)
                  .font(Font.system(size: 14))
              }
            }
          }
        }
      }
      
      Spacer()
    }.navigationBarTitle(Text("Recipe Detail"), displayMode: .inline)
  }
  
  init(recipeDetailViewModel: RecipeDetailViewModel) {
    self.viewModel = recipeDetailViewModel
  }
}

