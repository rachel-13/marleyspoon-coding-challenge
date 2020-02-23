//
//  Chef.swift
//  Marley Spoon Coding Challenge
//
//  Created by pohyee on 24/02/2020.
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
