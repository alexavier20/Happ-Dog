//
//  HomeViewController.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit
import Koloda

protocol HomeDisplaying: AnyObject {
    func loadHome(dogs: [Dog])
}

private var numberOfCards: Int = 5

final class HomeViewController: UIViewController {
    private let interactor: HomeInteracting
    
    lazy var kolodaView: KolodaView = {
        let koloda = KolodaView()
        koloda.translatesAutoresizingMaskIntoConstraints = false
        
        return koloda
    }()
    
    lazy var buttonView: ButtonsView = {
       let btnView = ButtonsView()
        
        btnView.translatesAutoresizingMaskIntoConstraints = false
        return btnView
    }()
    
    let images = ["dog1", "dog2", "dog3", "dog4"]
    
    func configureDogCardViewConstraints() {
        NSLayoutConstraint.activate([
            kolodaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            kolodaView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            kolodaView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            kolodaView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70),
        ])
    }
    
    func configureButtonsViewConstraints() {
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: kolodaView.bottomAnchor, constant: 16),
            buttonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.initialFetch()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        buildLayout()
    }
    
    init(interactor: HomeInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
}

extension HomeViewController: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection)
    {
        if direction == .left {
          //...
          print ("swipe left")
        }
        if direction == .right {
          //...
          print("swipe right")
        }
    }
}

extension HomeViewController: KolodaViewDataSource {

    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return 4
    }

    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view: UIImageView = .cardImage(image: UIImage(named: images[index]) ?? UIImage(), cornerRadius: 8, interactionEnabled: true, contentMode: .scaleAspectFill, sizeToFit: true)
        return view
    }
}

extension HomeViewController: HomeDisplaying {
    func loadHome(dogs: [Dog]) {
        buttonView.loadKolodaview(koloda: kolodaView)
        
        //for dog in dogs {
            //Preciso criar um novo dogCardView aqui dentro, para cada cachorro um card
            //MAS o objeto nao seria global e nao sei como coloca-lo nas configuracoes(addSubview e Constraints).
            //dogCardView.loadDogCardView(dog: dog)
        //}
    }
}

extension HomeViewController: ViewLayout {
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureHierarchy() {
        view.addSubview(kolodaView)
        view.addSubview(buttonView)
    }
    
    func configureConstraints() {
        configureDogCardViewConstraints()
        configureButtonsViewConstraints()
    }
}
