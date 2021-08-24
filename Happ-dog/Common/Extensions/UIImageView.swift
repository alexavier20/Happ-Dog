//
//  ImageViewExtension.swift
//  Happ-dog
//
//  Created by Alex Xavier on 28/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    static func standardImage (cornerRadius: CGFloat, interactionEnabled: Bool, contentMode: UIView.ContentMode, sizeToFit: Bool) -> UIImageView {
        let imageView = UIImageView()
        //imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true        
        imageView.isUserInteractionEnabled = interactionEnabled
        imageView.contentMode = contentMode
        if sizeToFit {
            imageView.sizeToFit()
        }
        return imageView
    }
    
    static func cardImage (image: UIImage, cornerRadius: CGFloat, interactionEnabled: Bool, contentMode: UIView.ContentMode, sizeToFit: Bool) -> UIImageView {
           let imageView = UIImageView()
           imageView.image = image
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.layer.cornerRadius = cornerRadius
           imageView.clipsToBounds = true
           imageView.isUserInteractionEnabled = interactionEnabled
           imageView.contentMode = contentMode
           if sizeToFit {
               imageView.sizeToFit()
           }
           return imageView
       }
    
    func loadImge(withUrl url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
