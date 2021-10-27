//
//  ErrorView.swift
//  Happ-dog
//
//  Created by Alex Xavier on 18/10/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

final class ErrorView: UIView {
    private lazy var imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "dogError"))
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentCompressionResistancePriority(for: .vertical)
        return view
    }()
    
    private lazy var messageLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.font = label.font.withSize(24)
           label.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.66, alpha: 1.0)
           label.text = "Unexpected error."
           label.numberOfLines = 0
           return label
       }()
    
    func ConfigureImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
        ])
    }
    
    func ConfigureMessageLabelConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension ErrorView: ViewLayout {
    func configureView() {
        backgroundColor = .systemGray6
    }
    
    func configureHierarchy() {
        addSubview(messageLabel)
        addSubview(imageView)
    }
    
    func configureConstraints() {
        ConfigureMessageLabelConstraints()
        ConfigureImageViewConstraints()
    }
    
}
