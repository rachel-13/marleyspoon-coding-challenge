//
//  RecipeViewModelTests.swift
//  Marley Spoon Coding ChallengeTests
//
//  Created by pohyee on 22/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import XCTest
import Contentful
@testable import Marley_Spoon_Coding_Challenge

class RecipeViewModelTests: XCTestCase {
  
  var recipesViewModel: RecipesViewModel!
  var apiMock: APIMock!

  override func setUp() {
    apiMock = APIMock()
    recipesViewModel = RecipesViewModel(api: apiMock)
  }
  
  func test_fetchRecipesFromContentful_succeeds() {
    let tag1 = Tag(name: "fatfree")
    let chef1 = Chef(name: "Steve Cook")
    let recipe1 = Recipe(title: "Awesome Recipe",
                         description: "Awesome Recipe's Description",
                         calories:789,
                         chef: chef1,
                         tags: [tag1])

    let tag2 = Tag(name: "fruit")
    let chef2 = Chef(name: "Tim Apple")
    let recipe2 = Recipe(title: "Mediocre Recipe",
                         description: "Mediocre Recipe's Description",
                         calories:666,
                         chef: chef2,
                         tags: [tag1, tag2])

    let tag3 = Tag(name: "meat")
    let chef3 = Chef(name: "The Mountain")
    let recipe3 = Recipe(title: "Beefy Recipe",
                         description: "Beefy Recipe's Description",
                         calories:568,
                         chef: chef3,
                         tags: [tag1, tag3])

    apiMock.stubbedRecipes = [recipe1, recipe2, recipe3]
    recipesViewModel.fetchRecipes()
    XCTAssertEqual(apiMock.fetchRecipeCallCount, 1)
    XCTAssertEqual(apiMock.stubbedRecipes.count, recipesViewModel.recipes.count)
  }

  func test_fetchRecipesFromContentful_fails() {
    let expectedMessage = "Some example error message"
    apiMock.shouldAPISucceed = false
    apiMock.stubbedErrorString = expectedMessage
    recipesViewModel.fetchRecipes()

    XCTAssertEqual(apiMock.fetchRecipeCallCount, 1)
    XCTAssertEqual(expectedMessage, recipesViewModel.errorString)
  }
}
