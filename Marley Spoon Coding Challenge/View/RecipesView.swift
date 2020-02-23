//
//  RecipesView.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 22/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import SwiftUI
import Combine

struct RecipesView: View {
  @ObservedObject var viewModel: RecipesViewModel
  
  var body: some View {
    NavigationView {
      List(viewModel.recipes) { recipe in
        CardView(recipe: recipe)
        .onTapGesture { self.goToRecipeDetail() }
        .padding([.top], 12)
        .background(Color(.lightGray))
        .cornerRadius(20)
      }
      .navigationBarTitle("Recipes")
    }
    .onAppear {
      self.viewModel.fetchRecipes()
    }
  }
  
  init(viewModel: RecipesViewModel) {
    self.viewModel = viewModel
    UITableView.appearance().separatorStyle = .none
  }
  
  func goToRecipeDetail() {
    print("goto recipe detail")
  }
}

struct CardView: View {
  let recipe: Recipe
  
  init(recipe: Recipe) {
    self.recipe = recipe
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text("\(recipe.title ?? "No title")")
        .fontWeight(Font.Weight.medium)
        .font(Font.system(size: 20))
        .padding()
      Spacer()
      ImageView(withURL: recipe.photo?.urlString)
    }
  }
}

struct ImageView: View {
  @ObservedObject var imageLoader: ImageLoader
  @State var image: UIImage = UIImage()
  
  init(withURL url:String?) {
    if let unwrappedUrl = url {
      imageLoader = ImageLoader(urlString:unwrappedUrl)
    } else {
      let resourcePath = Bundle.main.resourcePath!
      let imgName = "food.png"
      let path = resourcePath + "/" + imgName
      imageLoader = ImageLoader(urlString:path)
    }
  }
  
  var body: some View {
    VStack {
      Image(uiImage: image)
        .resizable()
        .scaledToFill()
        .frame(minWidth: nil,
               idealWidth: nil,
               maxWidth: UIScreen.main.bounds.width - 20,
               minHeight: nil,
               idealHeight: nil,
               maxHeight: 300,
               alignment: .center)
        .clipped()
    }.onReceive(imageLoader.didChange) { data in
      self.image = UIImage(data: data) ?? UIImage()
    }
  }
}
