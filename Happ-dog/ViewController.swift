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
       
        
        let homeVC = UINavigationController(rootViewController: HomeFactory.make())
        let matchVC = UINavigationController(rootViewController: MatchFactory.make())
        //let searchVC = UINavigationController(rootViewController: SearchFactory.make())
        
        homeVC.title = "Home"
        matchVC.title = "Match"
        //searchVC.title = "Search"
        
        homeVC.tabBarItem.image = UIImage(named: "homeLogo")
        matchVC.tabBarItem.image = UIImage(named: "matchLogo")
        //searchVC.tabBarItem.image = UIImage(named: "searchLogo")
        
        self.setViewControllers([homeVC, matchVC], animated: true)
        self.tabBar.tintColor = .systemRed
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
    }
}

