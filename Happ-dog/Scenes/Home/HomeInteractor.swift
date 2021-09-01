//
//  HomeInteractor.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

protocol HomeInteracting: AnyObject {
    func initialFetch()
    func dogCount() -> Int
    func getDog(index: Int) -> Dog
    func getAllDogs() -> [Dog]
    func clearDogs()
}

final class HomeInteractor {
    private let presenter: HomePresenting
    private let service: HomeServicing
    var dogs: [Dog] = []
    
    init(presenter: HomePresenting, service: HomeServicing) {
        self.presenter = presenter
        self.service = service
    }
}

extension HomeInteractor: HomeInteracting {
    func initialFetch() {
        presenter.presentLoading(shouldPresent: true)
        
        service.InitialFetch(completion: { result in
            self.presenter.presentLoading(shouldPresent: false)
            
            switch result {
            case .success(let dogResponse) where dogResponse.count == 0:
                self.presenter.presentEmpty()
            case .success(let dogs):
                self.dogs.append(contentsOf: dogs.shuffled())
                self.presenter.presentdogs(dogs: dogs)
            case .failure:
                self.presenter.presentError()
            }
        })
    }
    
    func dogCount() -> Int {
        dogs.count
    }
    
    func getDog(index: Int) -> Dog {
        dogs[index]
    }
    
    func getAllDogs() -> [Dog] {
        dogs
    }
    
    func clearDogs() {
        dogs = []
    }
    
}
