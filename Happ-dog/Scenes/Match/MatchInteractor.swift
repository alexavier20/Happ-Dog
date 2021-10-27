//
//  MatchInteractor.swift
//  Happ-dog
//
//  Created by Alex Xavier on 27/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation

protocol MatchInteracting: AnyObject {
    func getAllMatchDogs()
    func matchDogsCount() -> Int
    func getMatchDog(indexPath: IndexPath) -> Dog
    func getAllDismatchDogs()
    func dismatchDogsCount() -> Int
    func getDismatchDog(indexPath: IndexPath) -> Dog
    func fetchDetails(indexPath: IndexPath)
}

final class MatchInteractor {
    private var matchDogs: [Dog] = []
    private var dismatchDogs: [Dog] = []
    private let presenter: MatchPresenting
    
    init(presenter: MatchPresenting) {
        self.presenter = presenter
    }
}

extension MatchInteractor: MatchInteracting {
    func fetchDetails(indexPath: IndexPath) {
        let dogSelected: Dog = self.matchDogs[indexPath.row]
        self.presenter.presentDetails(dog: dogSelected)
    }
    
    func getAllMatchDogs() {
        let localMatchDogs: [Dog] = LocalStorageManager().loadDogs(key: "memoryMatchDogs")
        self.matchDogs.append(contentsOf: localMatchDogs)
        
        if matchDogs.count == 0 {
            presenter.presentNoLikes()
        }
    }
    
    func matchDogsCount() -> Int {
        self.matchDogs.count
    }
    
    func getMatchDog(indexPath: IndexPath) -> Dog {
        self.matchDogs[indexPath.row]
    }
    
    func getAllDismatchDogs() {
        let localDismatchDogs: [Dog] = LocalStorageManager().loadDogs(key: "memoryDisMatchDogs")
        self.dismatchDogs.append(contentsOf: localDismatchDogs)
        
        if dismatchDogs.count == 0 {
            presenter.presentNoDislikes()
        }
    }
    
    func dismatchDogsCount() -> Int {
        self.dismatchDogs.count
    }
    
    func getDismatchDog(indexPath: IndexPath) -> Dog {
        self.dismatchDogs[indexPath.row]
    }
}
