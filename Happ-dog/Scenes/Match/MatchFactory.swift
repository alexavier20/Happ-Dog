//
//  MatchFactory.swift
//  Happ-dog
//
//  Created by Alex Xavier on 27/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

enum MatchFactory {
    static func make() -> MatchViewController {
        var coordinator: MatchCoordinating = MatchCoordinator()
        let presenter: MatchPresenting = MatchPresenter(coordinator: coordinator)
        let interactor: MatchInteracting = MatchInteractor(presenter: presenter)
        let viewController = MatchViewController(interactor: interactor)
        
        presenter.viewController = viewController
        coordinator.viewController = viewController
        
        return viewController
    }
}
