//
//  DetailsContentView.swift
//  Happ-dog
//
//  Created by Alex Xavier on 17/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

final class DetailsContentView: UIView {
    lazy var dogImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.clipsToBounds = true
//        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = .textLabel(
        text: "", size: 24,
        weight: .heavy,
        textColor: .black,
        textAlignment: .left,
        sizeToFit: true,
        adjustToFit: true
    )
    private lazy var temperamentLabel: UILabel = .textLabel(
        text: "",
        size: 16,
        weight: .regular,
        textColor: .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    private lazy var weightTitleLabel: UILabel = .textLabel(
        text: "Weight",
        size: 16,
        weight: .heavy,
        textColor: .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    private lazy var weightLabel: UILabel = .textLabel(
        text: "",
        size: 16,
        weight: .regular,
        textColor: .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    private lazy var breedForTitleLabel: UILabel = .textLabel(
        text: "Breed for",
        size: 16,
        weight: .heavy,
        textColor: .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
     func configureDogImageViewConstraints() {
         NSLayoutConstraint.activate([
             dogImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            dogImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
         ])
     }
     
    func configureNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: dogImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func configureTemperamentLabelConstraints() {
        NSLayoutConstraint.activate([
            temperamentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            temperamentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            temperamentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func configureWeightTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            weightTitleLabel.topAnchor.constraint(equalTo: temperamentLabel.bottomAnchor, constant: 16),
            weightTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            weightTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func configureWeightLabelConstraints() {
        NSLayoutConstraint.activate([
            weightLabel.topAnchor.constraint(equalTo: weightTitleLabel.bottomAnchor, constant: 8),
            weightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            weightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            weightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configureBreedForLabelConstraints() {
        NSLayoutConstraint.activate([
            breedForTitleLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 16),
            breedForTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            breedForTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            breedForTitleLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func loadDetailsContent(dog: Dog) {
        if let url = URL(string: dog.image.url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let dataImage = data, let image = UIImage(data: dataImage) else {
                    return
                }
                DispatchQueue.main.async {
                    let size = self.getRatioSize(image: image)
                    let scaleImage = self.resizeImage(image: image, targetSize: size)
                    
                    self.dogImageView.image = scaleImage
                    
                    NSLayoutConstraint.activate([
                        self.dogImageView.heightAnchor.constraint(equalToConstant: size.height),
                        self.dogImageView.widthAnchor.constraint(equalToConstant: size.width)
                    ])
                }
            }.resume()
        }
        nameLabel.text = dog.dogBreed
        temperamentLabel.text = dog.temperament
        weightLabel.text = dog.weight?.metric
    }
    
    func getRatioSize(image: UIImage) -> CGSize {
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

extension DetailsContentView: ViewLayout {
    func configureView() {
        
    }
    
    func configureHierarchy() {
        addSubview(dogImageView)
        addSubview(nameLabel)
        addSubview(temperamentLabel)
        addSubview(weightTitleLabel)
        addSubview(weightLabel)
        
        addSubview(breedForTitleLabel)
    }
    
    func configureConstraints() {
        configureDogImageViewConstraints()
        configureNameLabelConstraints()
        configureTemperamentLabelConstraints()
        configureWeightTitleLabelConstraints()
        configureWeightLabelConstraints()
        
        configureBreedForLabelConstraints()
    }
    
}
