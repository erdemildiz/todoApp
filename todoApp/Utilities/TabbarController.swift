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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Setup tabbar
        setupTabbarItem()
    }
    
    fileprivate func setupTabbarItem() {
        // First tabbar
        let categoriBuilder         = CategoriBuilder()
        let categoriListView        = categoriBuilder.createlistView()
        let categoriTabbarItem      = UITabBarItem(title: "Categories", image: nil, selectedImage: nil)
        categoriListView.tabBarItem = categoriTabbarItem
        // Second tabbar
        let favouriteBuilder        = FavouriteBuilder()
        let favouriteList           = favouriteBuilder.createListView()
        let favouriteTabbarItem     = UITabBarItem(title: "Favourites", image: nil, selectedImage: nil)
        favouriteList.tabBarItem    = favouriteTabbarItem
        
        self.viewControllers = [categoriListView, favouriteList]
    }
}
