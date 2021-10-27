//
//  MatchDogCustomCell.swift
//  Happ-dog
//
//  Created by Alex Xavier on 06/10/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

class MatchDogCustomCell: UICollectionViewCell {
    static let identifier = "cell"
    
    private lazy var dogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    func configureDogImageViewConstraints() {
        NSLayoutConstraint.activate([
            dogImageView.topAnchor.constraint(equalTo: topAnchor),
            dogImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dogImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dogImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setup(dog: Dog) {
        if let url = URL(string: dog.image.url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let dataImage = data, let image = UIImage(data: dataImage) else {
                    return
                }
                DispatchQueue.main.async {
                    let size = ImageUtil().getRatioSize(image: image, frame: self.frame)
                    let scaleImage = ImageUtil().resizeImage(image: image, targetSize: size)
                    
                    self.dogImageView.image = scaleImage
                    
                    NSLayoutConstraint.activate([
                        self.dogImageView.heightAnchor.constraint(equalToConstant: size.height),
                        self.dogImageView.widthAnchor.constraint(equalToConstant: size.width)
                    ])
                }
            }.resume()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MatchDogCustomCell: ViewLayout {
    func configureView() {
        
    }
    
    func configureHierarchy() {
        addSubview(dogImageView)
    }
    
    func configureConstraints() {
        configureDogImageViewConstraints()
    }
}
