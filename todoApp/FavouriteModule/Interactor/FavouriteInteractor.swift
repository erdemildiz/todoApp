//
//  FavouriteInteractor.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

protocol FavouriteInteractorDelegate {
    func fetchFavourites()
}

class FavouriteInteractor {
    var presenter: FavouritePresenterDelegate?
}

extension FavouriteInteractor: FavouriteInteractorDelegate {
    
    func fetchFavourites() {
        
    }
    
}
