//
//  MatchPresenter.swift
//  Happ-dog
//
//  Created by Alex Xavier on 27/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation

protocol MatchPresenting: AnyObject {
    var viewController: MatchDisplaying? { get set }
    func presentDetails(dog: Dog)
//    func presentError()
    func presentNoLikes()
    func presentNoDislikes()
}

final class MatchPresenter {
    var viewController: MatchDisplaying?
    private let coordinator: MatchCoordinating
    
    init(coordinator: MatchCoordinating) {
        self.coordinator = coordinator
    }
}

extension MatchPresenter: MatchPresenting {
    func presentNoDislikes() {
        viewController?.displayNoDislikes()
    }
    
    func presentNoLikes() {
        viewController?.displayNoLikes()
    }
    
//    func presentError() {
//        viewController?.displayError()
//    }
    
    func presentDetails(dog: Dog) {
        self.coordinator.perform(action: .details(dog: dog))
    }
}
