//
//  APIMock.swift
//  Marley Spoon Coding ChallengeTests
//
//  Created by pohyee on 24/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import Marley_Spoon_Coding_Challenge
import RxCocoa

public class APIMock: APIProtocol {

  public var result = BehaviorRelay<[Recipe]>(value: [])
  
  var fetchRecipeCallCount = 0
  public func fetchRecipesFromContentful() {
    fetchRecipeCallCount += 1
  }
  
  func stubResultWith(recipes: [Recipe]) {
    result.accept(recipes)
  }

}
