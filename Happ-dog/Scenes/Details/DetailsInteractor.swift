//
//  DetailsInteractor.swift
//  Happ-dog
//
//  Created by Alex Xavier on 13/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation

protocol DetailsInteracting: AnyObject {
    func loadDogDetails()
}

final class DetailsInteractor {
    private let presenter: DetailsPresenting
    private let dog: Dog?
    
    init(presenter: DetailsPresenting,dog: Dog) {
        self.presenter = presenter
        self.dog = dog
    }
}

extension DetailsInteractor: DetailsInteracting {
    func loadDogDetails() {
        if let selectedDog = dog {
            self.presenter.presentDetails(dog: selectedDog)
        }
        else {
            self.presenter.presentError()
        }
        
    }
}
