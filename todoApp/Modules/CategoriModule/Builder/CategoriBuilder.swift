//
//  CategoriBuilder.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

class CategoriBuilder {
    
    func createlistView() -> CategoriListController {
        
        let view        = CategoriListController()
        let presenter   = CategoriPresenter()
        let interactor  = CategoriInteractor()
        let router      = CategoriRouter()
        
        // Setup
        view.presenter              = presenter
        presenter.listView          = view
        presenter.router            = router
        presenter.interactor        = interactor
        interactor.presenter        = presenter
        
        return view
    }
    
    func createUpdateView(categoriItem: CategoriItem? = nil) -> CategoriAddUpdateController {
        
        let view          = CategoriAddUpdateController()
        view.categoriItem = categoriItem
        
        return view
    }
    
}
