//
//  AppCoordinator.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 08.02.22.
//

import UIKit
import Combine
import SwiftUI

class AppCoordinator: Coordinator {
    
    private(set) var childCoordinator: [Coordinator] = []
    private var cancellables: Set<AnyCancellable> = []
    
    var navigationController: UINavigationController
    var onCompleted: (() -> Void)?
    
    public init(navigationController: UINavigationController, onCompleted: (() -> Void)? = nil) {
        self.navigationController = navigationController
        self.onCompleted = onCompleted
    }
    
    var navigationViewModel = NavigationViewModel()
    
    func start() {
        navigationViewModel
            .$tag
            .subscribe(on: RunLoop.main)
            .sink { [weak self] tag in
                guard let self = self else { return }
                if tag == 0 {
                    self.navigationController.navigationBar.topItem?.title = "Friends"
                } else if tag == 1 {
                    self.navigationController.navigationBar.topItem?.title = "Community"
                } else if tag == 2 {
                    self.navigationController.navigationBar.topItem?.title = "Wall"
                }
            }
            .store(in: &cancellables)
    }
    
    
}
