//
//  CardView.swift
//  Happ-dog
//
//  Created by Alex Xavier on 31/08/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit
import Koloda

class Cardview: UIView {
    
    lazy var dogImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy var nameLabel: UILabel = .textLabel(
        text: "",
        size: 24,
        weight: .heavy,
        textColor: .white,
        textAlignment: .left,
        sizeToFit: true,
        adjustToFit: true
    )
    
    lazy var breedForLabel: UILabel = .textLabel(
        text: "",
        size: 16,
        weight: .medium,
        textColor: .white,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
        
    lazy var viewInformation: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.layer.zPosition = 1
        
        return view
    }()
    
    func configureDogImageViewConstraints() {
        NSLayoutConstraint.activate([
            dogImageView.topAnchor.constraint(equalTo: topAnchor),
            dogImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dogImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dogImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
    
    func configureViewInformationConstraints() {
        NSLayoutConstraint.activate([
            viewInformation.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            viewInformation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            viewInformation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            viewInformation.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func configureNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: viewInformation.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: viewInformation.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewInformation.trailingAnchor, constant: -16)
        ])
    }
    
    func configureTemperamentLabelConstraints() {
        NSLayoutConstraint.activate([
            breedForLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            breedForLabel.leadingAnchor.constraint(equalTo: viewInformation.leadingAnchor, constant: 16),
        ])
    }
    
    func loadCardView(dogImage: UIImage, dog: Dog) {
        self.dogImageView.image = dogImage
        self.nameLabel.text = dog.name
        self.breedForLabel.text = dog.name
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension Cardview: ViewLayout {
    func configureView() {
        
    }
    
    func configureHierarchy() {
        addSubview(dogImageView)
        addSubview(viewInformation)
        viewInformation.addSubview(nameLabel)
        viewInformation.addSubview(breedForLabel)
    }
    
    func configureConstraints() {
        configureDogImageViewConstraints()
        configureViewInformationConstraints()
        configureNameLabelConstraints()
        configureTemperamentLabelConstraints()
    }
}
