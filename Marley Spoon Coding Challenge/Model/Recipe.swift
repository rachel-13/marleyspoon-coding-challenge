//
//  Recipe.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 23/02/2020.
//  Copyright © 2020 pohyee. All rights reserved.
//

import Contentful

public final class Chef: EntryDecodable, FieldKeysQueryable {
  
  public static let contentTypeId: String = "chef"
  
  public let id: String
  public let localeCode: String?
  public let updatedAt: Date?
  public let createdAt: Date?
  
  public let name: String?
  
  public required init(from decoder: Decoder) throws {
    let sys = try decoder.sys()
    id = sys.id
    localeCode = sys.locale
    updatedAt = sys.updatedAt
    createdAt = sys.createdAt
    
    let fields = try decoder.contentfulFieldsContainer(keyedBy: Chef.FieldKeys.self)
    
    self.name = try fields.decodeIfPresent(String.self, forKey: .name)
  }
  
  public enum FieldKeys: String, CodingKey {
    case name
  }
}

public final class Tag: EntryDecodable, FieldKeysQueryable {
  
  public static let contentTypeId: String = "tag"
  
  public let id: String
  public let localeCode: String?
  public let updatedAt: Date?
  public let createdAt: Date?
  
  public let name: String?
  
  public required init(from decoder: Decoder) throws {
    let sys = try decoder.sys()
    id = sys.id
    localeCode = sys.locale
    updatedAt = sys.updatedAt
    createdAt = sys.createdAt
    
    let fields = try decoder.contentfulFieldsContainer(keyedBy: Tag.FieldKeys.self)
    
    self.name = try fields.decodeIfPresent(String.self, forKey: .name)
  }
  
  public enum FieldKeys: String, CodingKey {
    case name
  }
}

public final class Recipe: EntryDecodable, FieldKeysQueryable, Identifiable {
  
  public static let contentTypeId: String = "recipe"
  
  public let id: String
  public let localeCode: String?
  public let updatedAt: Date?
  public let createdAt: Date?
  
  public let title: String?
  public let description: String?
  public let calories: Int?
  
  // Linked fields
  public var chef: Chef?
  public var photo: Asset?
  public var tags: [Tag]?
  
  public required init(from decoder: Decoder) throws {
    let sys = try decoder.sys()
    id = sys.id
    localeCode = sys.locale
    updatedAt = sys.updatedAt
    createdAt = sys.createdAt
    
    let fields = try decoder.contentfulFieldsContainer(keyedBy: Recipe.FieldKeys.self)
    
    self.title = try fields.decodeIfPresent(String.self, forKey: .title)
    self.description = try fields.decodeIfPresent(String.self, forKey: .description)
    self.calories = try fields.decodeIfPresent(Int.self, forKey: .calories)
    
    try fields.resolveLink(forKey: .chef, decoder: decoder) { [weak self] linkedChef in
      self?.chef = linkedChef as? Chef
    }
    
    try fields.resolveLink(forKey: .photo, decoder: decoder) { [weak self] photo in
      self?.photo = photo as? Asset
    }
    
    try fields.resolveLinksArray(forKey: .tags, decoder: decoder) { [weak self] tags in
      self?.tags = tags as? [Tag]
    }
  }
  
  public enum FieldKeys: String, CodingKey {
    case title, description, tags, chef, photo, calories, name
  }
}


