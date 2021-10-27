//
//  LocalStorageManager.swift
//  Happ-dog
//
//  Created by Alex Xavier on 27/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation

class LocalStorageManager {
    func loadDogs(key: String) -> [Dog] {
        guard let encodedData = UserDefaults.standard.array(forKey: key) as? [Data] else {
            return []
        }

        return encodedData.map { try! JSONDecoder().decode(Dog.self, from: $0) }
    }
    
    func saveDogs(dog: Dog, key: String) {
        var dogs:[Dog] = loadDogs(key: key)
        dogs.append(dog)
        
        let data = dogs.map { try? JSONEncoder().encode($0) }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: key)
    }
}
