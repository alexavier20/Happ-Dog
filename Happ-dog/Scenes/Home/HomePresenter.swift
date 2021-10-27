//
//  HomePresenter.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

protocol HomePresenting: AnyObject {
    var viewController: HomeDisplaying? { get set }
    func presentdogs(dogs: [Dog])
    func presentError()
    func presentLoading(shouldPresent: Bool)
    func presentEmpty()
    func presentDetails(dog: Dog)
}

final class HomePresenter {
    private let coordinator: HomeCoordinating
    weak var viewController: HomeDisplaying?
    
    init(coordinator: HomeCoordinating) {
        self.coordinator = coordinator
    }
}

extension HomePresenter: HomePresenting {
    func presentDetails(dog: Dog) {
        coordinator.perform(action: .details(dog: dog))
    }
    
    func presentdogs(dogs: [Dog]) {
        viewController?.loadHome(dogs: dogs)
    }
    
    func presentEmpty() {
        
    }
    
    func presentError() {
        viewController?.displayError()
    }
    
    func presentLoading(shouldPresent: Bool) {
        
    }
    
}
