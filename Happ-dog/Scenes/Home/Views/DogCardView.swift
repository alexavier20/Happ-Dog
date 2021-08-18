//
//  DogCardView.swift
//  Haap-dog
//
//  Created by Alex Xavier on 18/08/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

final class DogCardView: UIView {
    
    lazy var dogCardView: DogImageView = {
        let tc = DogImageView()
        tc.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipeCard(sender:))))
        return tc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
}

extension DogCardView: ViewLayout {
    func configureView() {
        
    }
    
    func configureHierarchy() {
        
    }
    
    func configureConstraints() {
        
    }
}
