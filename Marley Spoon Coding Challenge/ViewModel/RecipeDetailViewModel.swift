//
//  RecipeDetailViewModel.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 23/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import Combine

public class RecipeDetailViewModel: ObservableObject {
  
  @Published var title: String = ""
  @Published var description: String = ""
  @Published var calories: Int = 0
  @Published var chefName: String = ""
  @Published var photoUrl: String = ""
  @Published var recipeTags = [String]()
  
  public init(recipe: Recipe) {
    guard let title = recipe.title,
      let description = recipe.description,
      let calories = recipe.calories,
      let photoUrl = recipe.photo?.urlString else {
        return
    }
    
    self.title = title
    self.description = description
    self.calories = calories
    self.photoUrl = photoUrl
    
    if let tags = recipe.tags {
      for tag in tags {
        if let tagName = tag.name {
          recipeTags.append(tagName)
        }
      }
    }
    
    if let chefName = recipe.chef?.name {
      self.chefName = chefName
    }
  }
  
}
