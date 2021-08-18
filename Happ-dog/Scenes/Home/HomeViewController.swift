//
//  HomeViewController.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

protocol HomeDisplaying: AnyObject {
    func loadHome(dogs: [Dog])
}

final class HomeViewController: UIViewController {
    private let interactor: HomeInteracting
    
    lazy var dogCardView: DogCardView = {
        let tc = DogCardView()
        tc.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipeCard(sender:))))
        return tc
    }()
    
    let buttonsContainer: ButtonsView = {
        let c = ButtonsView()
        return c
    }()
    
    func configureDogCardViewConstraints() {
        NSLayoutConstraint.activate([
            dogCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            dogCardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            dogCardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dogCardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70),            
        ])
    }
    
    func configureButtonsContainerViewConstraints() {        
        NSLayoutConstraint.activate([
            buttonsContainer.topAnchor.constraint(equalTo: dogCardView.bottomAnchor, constant: 16),
            buttonsContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsContainer.widthAnchor.constraint(equalTo: dogCardView.widthAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.initialFetch()
        buildLayout()
    }
    
    init(interactor: HomeInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    @objc func swipeCard(sender: UIPanGestureRecognizer) {
        if let card = sender.view {
            sender.swipeView(card)
        }
    }
}

extension HomeViewController: HomeDisplaying {
    func loadHome(dogs: [Dog]) {
        
        for dog in dogs {
            //Preciso criar um novo dogCardView aqui dentro, para cada cachorro um card
            //MAS o objeto nao seria global e nao sei como coloca-lo nas configuracoes(addSubview e Constraints).
            dogCardView.loadDogCardView(dog: dog)
        }
    }
}

extension HomeViewController: ViewLayout {
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureHierarchy() {
        view.addSubview(dogCardView)
        view.addSubview(buttonsContainer)
    }
    
    func configureConstraints() {
        configureDogCardViewConstraints()
        configureButtonsContainerViewConstraints()
    }
    
}
