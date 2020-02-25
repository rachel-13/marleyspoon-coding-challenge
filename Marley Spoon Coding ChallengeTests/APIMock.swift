//
//  APIMock.swift
//  Marley Spoon Coding ChallengeTests
//
//  Created by pohyee on 24/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import Marley_Spoon_Coding_Challenge
import RxCocoa
import Contentful

public class APIMock: APIProtocol {
  public var result = BehaviorRelay<Result<[Recipe]>>(value: .success([]))
  
  var fetchRecipeCallCount = 0
  var stubbedRecipes: [Recipe] = []
  var stubbedErrorString = ""
  var shouldAPISucceed: Bool = true
  public func fetchRecipesFromContentful() {
    fetchRecipeCallCount += 1
    if shouldAPISucceed {
      result.accept(.success(stubbedRecipes))
    } else {
      let error = MockError.dummyError(message: stubbedErrorString)
      result.accept(.error(error))
    }
  }
}

enum MockError: Error, LocalizedError {
  case dummyError(message: String)

  public var errorDescription: String? {
    switch self {
    case .dummyError(let message):
      return message
    }
  }
}


