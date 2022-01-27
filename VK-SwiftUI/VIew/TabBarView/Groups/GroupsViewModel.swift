//
//  GroupsViewModel.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 25.01.22.
//

import Foundation
import RealmSwift

class GroupsViewModel: ObservableObject {
    
    let realmService: AnyRealmService
    let vkService: VKService
    
    private var notificationToken: NotificationToken?
    let objectWillChange = ObjectWillChangePublisher()
    
    var detachedGroups: [Group] { realmGroups?.map { $0.detached() } ?? [] }
   
    private lazy var realmGroups: Results<Group>? = try? realmService.get(Group.self, configuration: Realm.Configuration(deleteRealmIfMigrationNeeded: true))
    

    
    init(realmService: AnyRealmService, vkService: VKService) {
        self.realmService = realmService
        self.vkService = vkService
        subscribeForDatabaseChanges()
    }
    
    private func subscribeForDatabaseChanges() {
        notificationToken = realmGroups?.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    
    func getGroups() {
        vkService.getGroups { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let groups):
                try? self.realmService.save(items: groups,
                                            configuration: Realm.Configuration(deleteRealmIfMigrationNeeded: true),
                                            update: .modified)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
