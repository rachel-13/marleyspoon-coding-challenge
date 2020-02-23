//
//  ImageView.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 23/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import SwiftUI
import Combine

struct ImageView: View {
  @ObservedObject var imageLoader: ImageLoader
  @State var image: UIImage = UIImage()
  
  let maxWidth: CGFloat
  let maxHeight: CGFloat
  
  init(withURL url:String?, maxWidth: CGFloat, maxHeight: CGFloat) {
    if let unwrappedUrl = url {
      imageLoader = ImageLoader(urlString:unwrappedUrl)
    } else {
      let resourcePath = Bundle.main.resourcePath!
      let imgName = "food.png"
      let path = resourcePath + "/" + imgName
      imageLoader = ImageLoader(urlString:path)
    }
    
    self.maxWidth = maxWidth
    self.maxHeight = maxHeight
  }
  
  var body: some View {
    VStack {
      Image(uiImage: image)
        .resizable()
        .scaledToFill()
        .frame(minWidth: nil,
               idealWidth: nil,
               maxWidth: maxWidth,
               minHeight: nil,
               idealHeight: nil,
               maxHeight: maxHeight,
               alignment: .center)
        .clipped()
    }.onReceive(imageLoader.didChange) { data in
      self.image = UIImage(data: data) ?? UIImage()
    }
  }
}


