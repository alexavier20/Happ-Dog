//
//  MatchViewController.swift
//  Happ-dog
//
//  Created by Alex Xavier on 31/08/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

protocol MatchDisplaying: AnyObject {
    func displayError()
    func hideError()
    func displayNoLikes()
    func hideNoLikes()
    func displayNoDislikes()
    func hideNoDislikes()
}

final class MatchViewController: UIViewController {
    private let interactor: MatchInteracting
    
    private lazy var errorView: UIView = {
        let view: UIView = ErrorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var noLikesView: NotFoundView = {
        let view: NotFoundView = NotFoundView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var noDislikesView: NotFoundView = {
        let view: NotFoundView = NotFoundView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var matchLabel: UILabel = .textLabel(
        text: "Matches",
        size: 16,
        weight: .medium,
        textColor: UIColor(named: "red-primary") ?? .systemRed,
        textAlignment: .left,
        sizeToFit: true,
        adjustToFit: true
    )
    
    lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.tag = 1
        cv.register(MatchDogCustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    private lazy var dislikeLabel: UILabel = .textLabel(
        text: "Dislikes",
        size: 16,
        weight: .medium,
        textColor: UIColor(named: "red-primary") ?? .systemRed,
        textAlignment: .left,
        sizeToFit: true,
        adjustToFit: true
    )
    
    lazy var dislikesCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.tag = 2
        cv.register(MatchDogCustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
        interactor.getAllMatchDogs()
        interactor.getAllDismatchDogs()
    }
    
    init(interactor: MatchInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
 
    required init?(coder: NSCoder) { nil }
    
    func noLikesViewConstraints() {
        NSLayoutConstraint.activate([
            noLikesView.topAnchor.constraint(equalTo: matchLabel.bottomAnchor, constant: 16),
            noLikesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            noLikesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            noLikesView.bottomAnchor.constraint(equalTo: dislikeLabel.topAnchor, constant: -16)
        ])
    }
    
    func noDislikesViewConstraints() {
        NSLayoutConstraint.activate([
            noDislikesView.topAnchor.constraint(equalTo: dislikeLabel.bottomAnchor, constant: 16),
            noDislikesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            noDislikesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            noDislikesView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
        
    func collectionMatchesLabelConstraints() {
        NSLayoutConstraint.activate([
            matchLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            matchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            matchLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    func collectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: matchLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 2)
        ])
    }
    
    func dislikeLabelConstraints() {
        NSLayoutConstraint.activate([
            dislikeLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 32),
            dislikeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dislikeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    func dislikesCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            dislikesCollectionView.topAnchor.constraint(equalTo: dislikeLabel.bottomAnchor, constant: 16),
            dislikesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dislikesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            dislikesCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 2)
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
}

extension MatchViewController: MatchDisplaying {
    func displayNoDislikes() {
        noDislikesView.loadNotfound(message: "New Dislikes Will appear here.")
        view.addSubview(noDislikesView)
        view.bringSubviewToFront(noDislikesView)
        noDislikesView.isHidden = false
        noDislikesViewConstraints()
    }
    
    func hideNoDislikes() {
        noDislikesView.isHidden = true
        noDislikesView.removeFromSuperview()
    }
    
    func hideNoLikes() {
        noLikesView.isHidden = true
        noLikesView.removeFromSuperview()
    }
    
    func displayNoLikes() {
        noLikesView.loadNotfound(message: "New Likes Will appear here.")
        view.addSubview(noLikesView)
        view.bringSubviewToFront(noLikesView)
        noLikesView.isHidden = false
        noLikesViewConstraints()
    }
    
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
}

extension MatchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return interactor.matchDogsCount()
        } else {
            return interactor.dismatchDogsCount()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchDogCustomCell.identifier, for: indexPath) as? MatchDogCustomCell else {
            return UICollectionViewCell()
        }
        
        let dog: Dog
        if collectionView.tag == 1 {
            dog = interactor.getMatchDog(indexPath: indexPath)
        } else {
            dog = interactor.getDismatchDog(indexPath: indexPath)
        }
        
        cell.setup(dog: dog)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor.fetchDetails(indexPath: indexPath)
    }
}

extension MatchViewController: ViewLayout {
    func configureView() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
    }
    
    func configureHierarchy() {
        //view.addSubview(tableView)
        view.addSubview(matchLabel)
        view.addSubview(collectionView)
        view.addSubview(dislikeLabel)
        view.addSubview(dislikesCollectionView)
    }
    
    func configureConstraints() {
        //tableViewConstraints()
        collectionViewConstraints()
        collectionMatchesLabelConstraints()
        dislikeLabelConstraints()
        dislikesCollectionViewConstraints()
    }
}
