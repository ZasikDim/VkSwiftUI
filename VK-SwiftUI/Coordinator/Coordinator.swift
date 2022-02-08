//
//  Coordinator.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 08.02.22.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var childCoordinator: [Coordinator] { get }
    var onCompleted: (() -> Void)? { get set }
    
    func start()
}
