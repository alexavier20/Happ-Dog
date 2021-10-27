//
//  MatchCoordinator.swift
//  Happ-dog
//
//  Created by Alex Xavier on 29/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

enum MatchAction {
    case details(dog: Dog)
}

protocol MatchCoordinating {
    var viewController: UIViewController? { get set }
    func perform (action: MatchAction)
}

final class MatchCoordinator {
    weak var viewController: UIViewController?
}

extension MatchCoordinator: MatchCoordinating {
    func perform(action: MatchAction) {
        switch action {
        case .details(let dog):
            let detailsViewController = DetailsFactory.make(dog: dog)
            viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
        default:
            break
        }
    }
}
