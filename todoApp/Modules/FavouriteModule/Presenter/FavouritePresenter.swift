//
//  FavouritePresenter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

protocol FavouritePresenterDelegate {
    // Lifecycle
    func notifyDidLoad()
    // Data
    func fetchedFavList(favlist: [FavItem])
    func favListChanged()
}

class FavouritePresenter {
    weak var view: FavouriteController?
    var interactor: FavouriteInteractorDelegate?
    
    fileprivate func fetchFavList(){
        guard let interactor = interactor else { return }
        interactor.fetchFavourites()
    }
}

// MARK: Lifecycle
extension FavouritePresenter: FavouritePresenterDelegate {
    
    func notifyDidLoad() {
        guard let view = view else { return }
        view.setPageTitle()
        view.addObserver()
        fetchFavList()
    }
    
}

// MARK: Data
extension FavouritePresenter {
        
    func fetchedFavList(favlist: [FavItem]) {
        guard let view = view else { return }
        view.favItems = favlist
        view.reloadTableView()
    }
    
    func favListChanged() {
        fetchFavList()
    }
}
