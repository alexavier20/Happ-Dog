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
    func displayError()
    func hideError()
}

private var numberOfCards: Int = 5

final class HomeViewController: UIViewController {
    private let interactor: HomeInteracting
    
    private lazy var errorView: UIView = {
        let view: UIView = ErrorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var kolodaView: KolodaView = {
        let koloda = KolodaView()
        koloda.translatesAutoresizingMaskIntoConstraints = false
        koloda.countOfVisibleCards = 1
        return koloda
    }()
    
    lazy var cardView = Cardview()
    
    lazy var buttonView: ButtonsView = {
        let btnView = ButtonsView()
        btnView.translatesAutoresizingMaskIntoConstraints = false
        return btnView
    }()
    
    func configureDogCardViewConstraints() {
        NSLayoutConstraint.activate([
            kolodaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            kolodaView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            kolodaView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            kolodaView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.66),
        ])
    }
    
    func configureButtonsViewConstraints() {
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: kolodaView.bottomAnchor, constant: 16),
            buttonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func ErrorViewConstraints() {
        NSLayoutConstraint.activate([
            errorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
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
        let dog = interactor.getDog(index: index)
        interactor.fetchDetails(dog: dog)
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection)
    {
        let dog: Dog = interactor.getDog(index: index)
        
        if direction == .left {
            self.interactor.saveDogsLocalStorage(dog: dog, key: "memoryDisMatchDogs")
        }
        if direction == .right {          
            self.interactor.saveDogsLocalStorage(dog: dog, key: "memoryMatchDogs")
        }
    }
}

extension HomeViewController: KolodaViewDataSource {

    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return interactor.dogCount()
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let dog: Dog = interactor.getDog(index: index)
        
        var imageDog: UIImage = UIImage()
        let url = URL(string: dog.image.url)
        if let data = try? Data(contentsOf: url!)
        {
            imageDog = UIImage(data: data) ?? UIImage()
        }
        
        cardView.loadCardView(dogImage: imageDog, dog: dog)
        
        return cardView
    }
}

extension HomeViewController: HomeDisplaying {
    func displayError() {
        view.addSubview(errorView)
        view.bringSubviewToFront(errorView)
        errorView.isHidden = false
        
        ErrorViewConstraints()
    }
    
    func hideError() {
        errorView.isHidden = true
        errorView.removeFromSuperview()
    }
    
    func loadHome(dogs: [Dog]) {
        kolodaView.reloadData()
        buttonView.loadKolodaview(koloda: kolodaView)
    }
}

extension HomeViewController: ViewLayout {
    func configureView() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
    }
    
    func configureHierarchy() {
        view.addSubview(kolodaView)
        kolodaView.addSubview(cardView)
        view.addSubview(buttonView)
    }
    
    func configureConstraints() {
        configureDogCardViewConstraints()       
        configureButtonsViewConstraints()
        cardView.translatesAutoresizingMaskIntoConstraints = false
    }
}



