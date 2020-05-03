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
    lazy var storageManager: StorageManager? = {
        let manager = StorageManager()
        return manager
    }()
}

extension FavouriteInteractor: FavouriteInteractorDelegate {
    
    func fetchFavourites()  {
        guard let storageManager = self.storageManager else { return }
        guard let presenter = presenter else { return }
        var favItems = [FavItem]()
        let items = storageManager.realm.objects(Product.self).filter("isFavourite == true")
        for item  in items {
            favItems.append(
                FavItem(title: item.name)
            )
        }
        presenter.fetchedFavList(favlist: favItems)
    }
    
}
