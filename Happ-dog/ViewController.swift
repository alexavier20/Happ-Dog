//
//  ViewController.swift
//  Happ-dog
//
//  Created by Alex Xavier on 23/07/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let homeVC = HomeFactory.make()
        let matchVC = MatchViewController()
        let searchVC = SearchViewController()
        
        homeVC.title = "Home"
        matchVC.title = "Match"
        searchVC.title = "Search"
        
        homeVC.tabBarItem.image = UIImage(named: "homeLogo")
        matchVC.tabBarItem.image = UIImage(named: "matchLogo")
        searchVC.tabBarItem.image = UIImage(named: "searchLogo")
        
        self.setViewControllers([homeVC, matchVC, searchVC], animated: false)
        self.tabBar.tintColor = .systemRed
    }
}

