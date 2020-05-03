//
//  FavouriteBuilder.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

class FavouriteBuilder {
    
    func createListView() -> FavouriteController {
        let view        = FavouriteController()
        let presenter   = FavouritePresenter()
        let interactor  = FavouriteInteractor()

        // Setup
        view.presenter         = presenter
        presenter.view         = view
        presenter.interactor   = interactor
        interactor.presenter   = presenter

        return view
    }
}
