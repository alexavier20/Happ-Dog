//
//  UIButton.swift
//  Happ-dog
//
//  Created by Alex Xavier on 16/08/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import UIKit

extension UIButton {
    static func buttonWithImage (image: UIImage, cornerRadius: CGFloat, target: Any, selector: (Selector), sizeToFit: Bool) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(target, action: selector, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
        
        if sizeToFit {
            button.sizeToFit()
        }
        return button
    }
}
