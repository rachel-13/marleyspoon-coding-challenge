//
//  RecipeViewModelTests.swift
//  Marley Spoon Coding ChallengeTests
//
//  Created by pohyee on 22/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import XCTest
@testable import Marley_Spoon_Coding_Challenge

class RecipeViewModelTests: XCTestCase {
  
  var recipesViewModel: RecipesViewModel!
  var apiMock: APIMock!
  
  override func setUp() {
    apiMock = APIMock()
    recipesViewModel = RecipesViewModel(api: apiMock)
  }
  
  func test_fetchRecipesFromContentful_succeeds() {
    recipesViewModel.fetchRecipes()
    XCTAssertEqual(apiMock.fetchRecipeCallCount, 1)
  }
}
