//
//  FavouritePresenter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

protocol FavouritePresenterDelegate {
    func notifyDidLoad()
    func notifyWillAppear()
}

class FavouritePresenter {
    weak var view: FavouriteController?
    
}

// MARK: Interactor delegate
extension FavouritePresenter: FavouritePresenterDelegate {
    
    func notifyDidLoad() {
        
    }
    
    func notifyWillAppear() {
        
    }
    
}
