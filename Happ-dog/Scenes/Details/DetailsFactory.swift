//
//  DetailsFactory.swift
//  Happ-dog
//
//  Created by Alex Xavier on 13/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

enum DetailsFactory {
    static func make(dog: Dog) -> DetailsViewController {
        let presenter: DetailsPresenting = DetailsPresenter()
        let interactor: DetailsInteracting = DetailsInteractor(presenter: presenter, dog: dog)
        let viewController = DetailsViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
