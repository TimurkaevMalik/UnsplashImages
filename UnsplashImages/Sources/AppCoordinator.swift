//
//  AppCoordinator.swift
//  UnsplashImages
//
//  Created by Malik Timurkaev on 05.10.2025.
//

import UIKit
import CoreKit
import Foundation
import UnspAuthorization

@MainActor
final class AppCoordinator: CompositionCoordinator {
    
    var children: [Coordinator] = []
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        showAuthorizationFlow()
    }
    
    func didFinishChild(_ coordinator: any Coordinator) {
        removeChild(coordinator)
        showMainFlow()
    }
}

private extension AppCoordinator {
    func showMainFlow() {
        let vc = ViewController()
        navigation.setViewControllers([vc], animated: true)
    }
    
    func showAuthorizationFlow() {
        let child = RootUnspAuthCoordinator(navigation: navigation)
        addChild(child)
        child.start()
    }
}
