//
//  Friend.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 14.01.22.
//

import Foundation

struct Friend: Identifiable, Hashable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var photo: String
    var allPhotos: [String]?
    var homeTown: String
    var isOnline: Bool
}
