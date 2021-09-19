//
//  DetailsPresenter.swift
//  Happ-dog
//
//  Created by Alex Xavier on 13/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation

protocol DetailsPresenting: AnyObject {
    var viewController: DetailsDisplaying? { get set }
    func presentDetails(dog: Dog)
    func presentError()
}

final class DetailsPresenter {
    var viewController: DetailsDisplaying?
   
}

extension DetailsPresenter: DetailsPresenting {
    func presentError() {
        
    }
    
    func presentDetails(dog: Dog) {
        self.viewController?.loadDogDetails(dog: dog)
    }
}
