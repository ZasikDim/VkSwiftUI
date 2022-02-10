//
//  Group.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 14.01.22.
//

import Foundation
import RealmSwift

struct GroupsResponse: Codable {
    var response: GroupsItems
}

struct GroupsItems: Codable {
    var items: [Group]
}

class Group: Object, Codable, Identifiable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var photo: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case photo = "photo_100"
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
}
