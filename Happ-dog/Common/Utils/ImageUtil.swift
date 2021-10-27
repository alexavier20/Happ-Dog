//
//  ImageUtil.swift
//  Happ-dog
//
//  Created by Alex Xavier on 28/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

class ImageUtil {
    func getRatioSize(image: UIImage, frame: CGRect) -> CGSize {
        let myImageWidth = image.size.width
        let myImageHeight = image.size.height
        let myViewWidth = frame.size.width
        
        let ratio = myViewWidth / myImageWidth
        let scaledHeight = myImageHeight * ratio
        
        return CGSize(width: myViewWidth, height: scaledHeight)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
