//
//  RecipesViewModel.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 23/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import RxSwift

public class RecipesViewModel: ObservableObject {
  
  private let disposeBag = DisposeBag()
  private let api: APIProtocol

  @Published var errorString: String = ""
  @Published var recipes: [Recipe] = []
  
  public init(api: APIProtocol = API()) {
    self.api = api
    api.result.asDriver().asObservable().subscribe(onNext: { [weak self] result in
      switch result {
      case .success(let recipes):
        self?.recipes = recipes
      case .error(let error):
        self?.errorString = error.localizedDescription
      }
    }).disposed(by: disposeBag)
  }
  
  func fetchRecipes() {
    api.fetchRecipesFromContentful()
  }
}
