//
//  DogCardView.swift
//  Happ-dog
//
//  Created by Alex Xavier on 28/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

class DogCardView: BaseView {
    let profileImageView: UIImageView = .standardImage(cornerRadius: 0, interactionEnabled: true, contentMode: .scaleAspectFill, sizeToFit: true)
    //let friendsIconView = ImageViewFactory.standardImageView(image: #imageLiteral(resourceName: "friendsIcon"), cornerRadius: 0, interactionEnabled: false, contentMode: .scaleAspectFill, sizeToFit: false).new
    let containerView: BaseView = {
        let baseView = BaseView()
        baseView.backgroundColor = .white
        baseView.layer.cornerRadius = 10.0
        baseView.layer.borderWidth = 0.5
        baseView.layer.borderColor = UIColor.gray.cgColor
        baseView.clipsToBounds = true
        return baseView
    }()
    
    let infoContainerView: BaseView = {
        let baseView = BaseView()
        return baseView
    }()
    
    let nameLabel: UILabel = .textLabel(text: "", textColor: .gray, fontStyle: .headline, textAlignment: .left, sizeToFit: true, adjustToFit: true)
    let workLabel: UILabel = .textLabel(text: "Ele eh muito teimoso", textColor: .gray, fontStyle: .subheadline, textAlignment: .left, sizeToFit: true, adjustToFit: true)
    
    override func setUpViews() {
        buildLayout()
    }
    
    func ConfigureContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func ConfigureProfileImageViewConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            profileImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            profileImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.85)
        ])
    }
    
    func ConfigureInfoContainerViewConstraints() {
        NSLayoutConstraint.activate([
            infoContainerView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            infoContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            infoContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            infoContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor)
        ])
    }
    
    func ConfigureNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: 8),
        ])
    }
    
    func ConfigureWorkLabelConstraints() {
        NSLayoutConstraint.activate([
            workLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 8),
            workLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            //workLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor, constant: -8)
        ])
    }
    
    func loadDogCardView(dog: Dog) {
        let imageUrlString = dog.image.url
        guard let imageUrl:URL = URL(string: imageUrlString) else {
            return
        }
        
        profileImageView.loadImge(withUrl: imageUrl)
        nameLabel.text = dog.name
    }
}

extension DogCardView: ViewLayout {
    func configureView() {
        _ = infoContainerView.layoutMarginsGuide
    }
    
    func configureHierarchy() {
        addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(infoContainerView)
        infoContainerView.addSubview(nameLabel)
        infoContainerView.addSubview(workLabel)
        //infoContainerView.addSubview(friendsIconView)
    }
    
    func configureConstraints() {
        ConfigureContainerViewConstraints()
        ConfigureProfileImageViewConstraints()
        ConfigureInfoContainerViewConstraints()
        ConfigureNameLabelConstraints()
        ConfigureWorkLabelConstraints()
    }
    
}
