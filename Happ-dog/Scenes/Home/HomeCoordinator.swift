//
//  HomeCoordinator.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

enum HomeAction {
    case details(dog: Dog)
}

protocol HomeCoordinating {
    var viewController: UIViewController? { get set }
    func perform (action: HomeAction)
}

final class HomeCoordinator {
    weak var viewController: UIViewController?
}

extension HomeCoordinator: HomeCoordinating {
    func perform(action: HomeAction) {
        switch action {
        case .details(let dog):
            let detailsViewController = DetailsFactory.make(dog: dog)
            viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
        default:
            break
        }
    }
}
