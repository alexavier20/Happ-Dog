//
//  ViewLayout.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation

protocol ViewLayout: AnyObject {
    func configureView()
    func configureHierarchy()
    func configureConstraints()
}

extension ViewLayout {
    func buildLayout() {
        configureView()
        configureHierarchy()
        configureConstraints()
    }
}
