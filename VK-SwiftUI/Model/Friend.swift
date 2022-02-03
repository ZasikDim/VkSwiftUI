//
//  Friend.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 14.01.22.
//

import Foundation
import RealmSwift

struct FriendsResponse: Codable {
    var response: FriendsItems
}

struct FriendsItems: Codable {
    var items: [Friend]
}

class Friend: Object, Codable, Identifiable {
    @objc dynamic var firstName: String
    @objc dynamic var id: Int
    @objc dynamic var lastName: String?
    @objc dynamic var photo: String
    @objc dynamic var bdate: String?
    @objc dynamic var city: City?
    @objc dynamic var country: Country?
    var deactivated: Deactivated?
    
    enum CodingKeys: String, CodingKey {
        case id, city, country, bdate, deactivated
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_100"
    }
    override class func primaryKey() -> String? {
        "id"
    }
}

class City: Object, Codable, Identifiable {
    @objc dynamic var id: Int
    @objc dynamic var title: String
    
    enum CodingKeys: String, CodingKey {
        case id, title
    }
}

class Country: Object, Codable, Identifiable {
    @objc dynamic var id: Int
    @objc dynamic var title: String
    
    enum CodingKeys: String, CodingKey {
        case id, title
    }
}

enum Deactivated: String, Codable {
    case banned = "banned"
    case deleted = "deleted"
}
