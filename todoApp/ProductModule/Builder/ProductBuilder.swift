//
//  ProductBuilder.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

class ProductBuilder {
    
    func createListView(categoriItem: CategoriItem) -> ProductListController {
        
        let view        = ProductListController()
        let presenter   = ProductPresenter()
        let interactor  = ProductInteractor()
        let router      = ProductRouter()

        // Setup
        view.presenter         = presenter
        presenter.listView     = view
        presenter.router       = router
        presenter.categoriItem = categoriItem
        presenter.interactor   = interactor
        interactor.presenter   = presenter

        return view
    }
    
    func createUpdateView(productItem: ProductItem? = nil) -> ProductAddUpdateController {
        
        let view          = ProductAddUpdateController()
//        view.categoriItem = categoriItem
        
        return view
    }
}
