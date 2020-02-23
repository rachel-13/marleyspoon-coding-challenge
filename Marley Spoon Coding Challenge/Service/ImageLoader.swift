//
//  ImageLoader.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 23/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import SwiftUI
import Combine

public class ImageLoader: ObservableObject {
  var didChange = PassthroughSubject<Data, Never>()
  var data = Data() {
    didSet {
      didChange.send(data)
    }
  }
  
  public init(urlString:String) {
    guard let url = URL(string: urlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data else { return }
      DispatchQueue.main.async {
        self.data = data
      }
    }
    task.resume()
  }
}
