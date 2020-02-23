//
//  CardView.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 23/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import SwiftUI
import Combine

struct CardView: View {
  let recipe: Recipe
  
  init(recipe: Recipe) {
    self.recipe = recipe
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text("\(recipe.title ?? "")")
        .fontWeight(Font.Weight.medium)
        .font(Font.system(size: 20))
        .padding()
      Spacer()
      ImageView(withURL: recipe.photo?.urlString, maxWidth: UIScreen.main.bounds.width - 20, maxHeight: 300)
    }
    .padding([.top], 12)
    .background(Color(.lightGray))
    .cornerRadius(20)
    .shadow(radius: 5)
  }
}
