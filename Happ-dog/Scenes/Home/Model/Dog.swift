//
//  DogInformation.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//
// Usando Coding Keys e Init

import Foundation

struct Dog: Codable {
    let id: Int
    let name: String
    let bredFor: String?
    let breedGroup: String?
    let lifeSpan: String?
    let temperament: String?
    let origin: String?
    let height: Height?
    let weight: Weight?
    let image: Image
}

struct Image: Codable {
    let url: String
}

struct Height: Codable {
    let metric: String
}

struct Weight: Codable {
    let metric: String
}
