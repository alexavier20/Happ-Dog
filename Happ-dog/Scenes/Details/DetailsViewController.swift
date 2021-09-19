//
//  DetailsViewController.swift
//  Happ-dog
//
//  Created by Alex Xavier on 13/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

protocol DetailsDisplaying {
    func loadDogDetails(dog: Dog)
}

final class DetailsViewController: UIViewController {
    private let interactor: DetailsInteracting
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var detailsContentView: DetailsContentView = {
        let view = DetailsContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func configureScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
   
    func configureContentDetailsViewConstraints() {
        NSLayoutConstraint.activate([
            detailsContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            detailsContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            detailsContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            detailsContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            detailsContentView.widthAnchor.constraint(equalTo: view.widthAnchor) // THE TRICK
//            detailsContentView.topAnchor.constraint(equalTo: dogImageView.bottomAnchor, constant: 16),
            //detailsContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            //detailsContentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            //detailsContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
    }
    
    override func viewDidLoad() {
        interactor.loadDogDetails()
        buildLayout()
    }
    
    init(interactor: DetailsInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
}

extension DetailsViewController: DetailsDisplaying {
    func loadDogDetails(dog: Dog) {
        detailsContentView.loadDetailsContent(dog: dog)
    }  
}

extension DetailsViewController: ViewLayout {
    func configureView() {
        view.backgroundColor = .white
        
    }
    
    func configureHierarchy() {
        view.addSubview(scrollView)
//        scrollView.addSubview(dogImageView)
        scrollView.addSubview(detailsContentView)
    }
    
    func configureConstraints() {
        configureScrollViewConstraints()
//        configureDogImageViewConstraints()
        configureContentDetailsViewConstraints()
        
    }
    
}
