//
//  NotFoundView.swift
//  Happ-dog
//
//  Created by Alex Xavier on 21/10/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

final class NotFoundView: UIView {
    
    private lazy var noLikesLabel: UILabel = .textLabel(
        text: "",
        size: 17,
        weight: .medium,
        textColor: UIColor(named: "label-info") ?? .systemRed,
        textAlignment: .left,
        sizeToFit: true,
        adjustToFit: true
    )
    
    lazy var searchImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "dogfinder")
        
        return imageView
    }()
    
    func searchImageViewConstraints() {
        NSLayoutConstraint.activate([
            searchImageView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            searchImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func noLikesLabelConstraints() {
        NSLayoutConstraint.activate([
            noLikesLabel.topAnchor.constraint(equalTo: searchImageView.bottomAnchor, constant: 24),
            noLikesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func loadNotfound(message: String) {
        noLikesLabel.text = message
    }
    
    @objc func addPulse(){
        let pulse = Pulsing(numberOfPulses: 1, radius: 110, position: searchImageView.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.systemRed.cgColor
        
        self.layer.insertSublayer(pulse, below: searchImageView.layer)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension NotFoundView: ViewLayout {
    func configureView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.addPulse))
        tapGestureRecognizer.numberOfTapsRequired = 1
        searchImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func configureHierarchy() {
        addSubview(searchImageView)
        addSubview(noLikesLabel)     
    }
    
    func configureConstraints() {
        searchImageViewConstraints()
        noLikesLabelConstraints()
    }
}
