//
//  MainTabBarBuilder.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit

class MainTabBarBuilder {
    
    class func build() -> UIViewController {
        
        let mainViewController = MainViewBuilder.build()
        let accountViewController = AccountViewBuilder.build()

        let tabViewController = MainTabBarController()
        tabViewController.viewControllers = [mainViewController, accountViewController]
        tabViewController.tabBar.tintColor = .black
        tabViewController.tabBar.backgroundColor = .systemBackground
        
        return tabViewController
        
    }
    
}
