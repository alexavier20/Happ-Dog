//
//  UILabel.swift
//  Happ-dog
//
//  Created by Alex Xavier on 16/08/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import UIKit

extension UILabel {
    static func textLabel (text: String, textColor: UIColor, fontStyle: UIFont.TextStyle, textAlignment: NSTextAlignment?, sizeToFit: Bool, adjustToFit: Bool) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = adjustToFit
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: fontStyle)
        label.textAlignment = textAlignment ?? .left
        label.textColor = textColor
        if sizeToFit {
            label.sizeToFit()
        }
        return label
    }
}
