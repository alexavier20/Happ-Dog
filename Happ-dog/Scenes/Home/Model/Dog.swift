//
//  DogInformation.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation

struct Dog: Decodable {
    let id: Int
    let name: String
    //let bredFor: String
    //let lifeSpan: String
    //let temperament: String
    //let origin: String
    let image: Image
}

struct Image: Decodable {
    let url: String
}
