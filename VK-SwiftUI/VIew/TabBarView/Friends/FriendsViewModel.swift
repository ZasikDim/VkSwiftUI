//
//  FriendsViewModel.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 24.01.22.
//

import Foundation
import RealmSwift

class FriendsViewModel: ObservableObject {
    
    let vkService: VKService
    let realmService: AnyRealmService
    
    var detachedFriends: [Friend] { realmFriends?.map { $0.detached() } ?? [] }
    
    private var notificationToken: NotificationToken?
    let objectWillChange = ObjectWillChangePublisher()
    var error: Error?
    
    private lazy var realmFriends: Results<Friend>? = try? realmService.get(Friend.self, configuration: Realm.Configuration(deleteRealmIfMigrationNeeded: true)).sorted(byKeyPath: "firstName")
    
    init(realmService: AnyRealmService, vkService: VKService) {
        self.realmService = realmService
        self.vkService = vkService
        subscribeForDatabaseChanges()
    }
    
    private func subscribeForDatabaseChanges() {
        notificationToken = realmFriends?.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    func getFriends() {
        vkService.getFriends { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let friends):
                    try? self.realmService.save(items: friends, configuration: Realm.Configuration(deleteRealmIfMigrationNeeded: true), update: .modified)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
}
