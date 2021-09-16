//
//  HomeCoordinator.swift
//  Pazar
//
//  Created by tsamodol on 16.09.2021..
//

import RxSwift
import XCoordinator

enum GameManagmentRoute: Route {
    case gameManagment
    case dismiss
}

class GameDataManagmentCoordinator: NavigationCoordinator<GameManagmentRoute> {

    init() {
        super.init(initialRoute: .gameManagment)
    }

    // MARK: Overrides

    override func prepareTransition(for route: GameManagmentRoute) -> NavigationTransition {
        switch route {
        case .gameManagment:
            let gameManagementVC = ProductDetailsViewController()
            return .push(gameManagementVC)
        case .dismiss:
            return .dismiss()
        }
    }
}
