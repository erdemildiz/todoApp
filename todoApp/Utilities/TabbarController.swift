//
//  Tabbar.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {
    
    // MARK: Lifecycle - willAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup tabbar
        setupTabbarItem()
    }
    
    fileprivate func setupTabbarItem() {
        // First tabbar
        let categoriBuilder         = CategoriBuilder()
        let categoriListView        = categoriBuilder.createlistView()
        let categoriTabbarItem      = UITabBarItem(title: Tabbar.firstTabbar, image: Icons.categori, selectedImage: nil)
        categoriListView.tabBarItem = categoriTabbarItem
        let categoriWithNavbar      = UINavigationController(rootViewController: categoriListView)
        // Second tabbar
        let favouriteBuilder        = FavouriteBuilder()
        let favouriteList           = favouriteBuilder.createListView()
        let favouriteTabbarItem     = UITabBarItem(title: Tabbar.secondTabbar, image: Icons.favori, selectedImage: nil)
        favouriteList.tabBarItem    = favouriteTabbarItem
        let favouriteWithNavbar     = UINavigationController(rootViewController: favouriteList)
        
        self.viewControllers = [categoriWithNavbar, favouriteWithNavbar]
    }
}
