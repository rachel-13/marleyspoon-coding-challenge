//
//  API.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 22/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import Contentful
import RxSwift
import RxCocoa

public protocol APIProtocol {
  var result: BehaviorRelay<Result<[Recipe]>> { get }
  func fetchRecipesFromContentful()
}

public struct API: APIProtocol {

  public var result = BehaviorRelay<Result<[Recipe]>>(value: .success([]))
  private let client: Client
  
  public init() {
    client = Client(spaceId: "kk2bw5ojx476",
                    accessToken: "7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c",
                    contentTypeClasses: [Recipe.self, Chef.self, Tag.self])
  }
  
  public func fetchRecipesFromContentful() {
    let query = QueryOn<Recipe>.where(contentTypeId: "recipe")
    client.fetchArray(of: Recipe.self, matching: query) { (result: Result<HomogeneousArrayResponse<Recipe>>) in
      switch result {
      case .success(let arrayResponse):
        let recipes = arrayResponse.items
        self.result.accept(.success(recipes))
      case .error(let error):
        self.result.accept(.error(error))
      }
    }
  }
}
