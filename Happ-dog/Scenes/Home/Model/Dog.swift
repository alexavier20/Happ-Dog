//
//  DogInformation.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//
// Usando Coding Keys e Init

import Foundation

struct Dog: Decodable {
    let id: Int
    let dogBreed: String
    let bredFor: String?
    let breedGroup: String?
    let lifeSpan: String?
    let temperament: String?
    let origin: String?
    let height: Height?
    let weight: Weight?
    let image: Image
    
    enum CodingKeys: String, CodingKey {
        case id, name, bredFor, breedGroup, lifeSpan, temperament, origin, height, weight, image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        dogBreed = try container.decode(String.self, forKey: .name)
        bredFor = try container.decodeIfPresent(String.self, forKey: .bredFor)
        breedGroup = try container.decodeIfPresent(String.self, forKey: .breedGroup)
        lifeSpan = try container.decodeIfPresent(String.self, forKey: .lifeSpan)
        temperament = try container.decodeIfPresent(String.self, forKey: .temperament)
        origin = try container.decodeIfPresent(String.self, forKey: .origin)
        height = try container.decodeIfPresent(Height.self, forKey: .height)
        weight = try container.decodeIfPresent(Weight.self, forKey: .weight)
        image = try container.decode(Image.self, forKey: .image)
    }
}

struct Image: Decodable {
    let url: String
}

struct Height: Decodable {
    let metric: String
}

struct Weight: Decodable {
    let metric: String
}
