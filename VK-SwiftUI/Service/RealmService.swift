//
//  RealmService.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 26.01.22.
//

import Foundation
import RealmSwift

protocol AnyRealmService {
    func save<T: Object>(items: [T], configuration: Realm.Configuration, update: Realm.UpdatePolicy) throws
    func get<T: Object>(_ type: T.Type, configuration: Realm.Configuration) throws -> Results<T>
    func get<T: Object>(_ type: T.Type, configuration: Realm.Configuration) throws -> [T]
    func delete<T: Object>(object: T, configuration: Realm.Configuration) throws
}

class RealmService: AnyRealmService {
    func save<T: Object>(
        items: [T],
        configuration: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true),
        update: Realm.UpdatePolicy = .modified
    ) throws {
        let realm = try Realm(configuration: configuration)
        print(configuration.fileURL ?? "")
        try realm.write {
            realm.add(items, update: update)
        }
    }
    
    func get<T: Object>(
        _ type: T.Type,
        configuration: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    ) throws -> Results<T> {
        print(configuration.fileURL ?? "")
        let realm = try Realm(configuration: configuration)
        return realm.objects(type)
    }
    
    func get<T: Object>(
        _ type: T.Type,
        configuration: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    ) throws -> Array<T> {
        print(configuration.fileURL ?? "")
        let realm = try Realm(configuration: configuration)
        return realm.objects(type).map { $0.detached() }
    }
    
    func delete<T: Object>(
        object: T,
        configuration: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    ) throws {
        print(configuration.fileURL ?? "")
        let realm = try Realm(configuration: configuration)
        try realm.write {
            realm.delete(object)
        }
    }
}
