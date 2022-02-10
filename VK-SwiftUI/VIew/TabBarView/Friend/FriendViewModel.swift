//
//  FriendViewModel.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 31.01.22.
//

import Foundation

class FriendViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    let vkService: VKService
    
    init(vkService: VKService) {
        self.vkService = vkService
    }
    
    func getPhotos(for user: Friend) {
        if photos.isEmpty {
            vkService.getUserPhotos(ownerId: user.id) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let photos):
                    self.photos = photos
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
