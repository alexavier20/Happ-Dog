//
//  UILabel.swift
//  Happ-dog
//
//  Created by Alex Xavier on 16/08/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import UIKit

extension UILabel {
    static func textLabel (text: String, size: CGFloat, weight: UIFont.Weight, textColor: UIColor, textAlignment: NSTextAlignment?, sizeToFit: Bool, adjustToFit: Bool) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.adjustsFontSizeToFitWidth = adjustToFit
        label.text = text
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.textAlignment = textAlignment ?? .left
        label.textColor = textColor
//        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
      
//        if sizeToFit {
//            label.sizeToFit()
//        }
        return label
    }
}
