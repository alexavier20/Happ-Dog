//
//  ButtonsView.swift
//  Happ-dog
//
//  Created by Alex Xavier on 28/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import Koloda
import UIKit

var kolodaView: KolodaView!

class ButtonsView: UIView {
    lazy var likeButton: UIButton = .buttonWithImage(image: #imageLiteral(resourceName: "matchImg") , cornerRadius: 32, target: self, selector: #selector(like), sizeToFit: true)
    lazy var passButton: UIButton = .buttonWithImage(image: #imageLiteral(resourceName: "passImg"), cornerRadius: 32, target: self, selector: #selector(pass), sizeToFit: true)
    
    lazy var container: UIStackView = {
        let c = UIStackView(arrangedSubviews: [
             self.passButton, self.likeButton,
            ])
        c.translatesAutoresizingMaskIntoConstraints = false
        c.spacing = 20
        c.distribution = .fillEqually
        return c
    }()
    
    func configureContainerConstraint() {
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.widthAnchor.constraint(equalTo: widthAnchor),
            container.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func loadKolodaview(koloda: KolodaView) {
        kolodaView = koloda
    }
    
    @objc func like() {
        kolodaView?.swipe(.right)
        print("like print")
    }
    @objc func pass() {
        kolodaView?.swipe(.left)
        print("pass print")
    }
}

extension ButtonsView: ViewLayout {
    func configureView() {
        
    }
    
    func configureHierarchy() {
         addSubview(container)
    }
    
    func configureConstraints() {
        configureContainerConstraint()
    }
    
}
