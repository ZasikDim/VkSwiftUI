//
//  Group.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 14.01.22.
//

import Foundation

struct Group: Identifiable {
    var id = UUID()
    var name: String
    var info: String
    var description: String
    var photo: String
    var allPhotos: [String]?
}
