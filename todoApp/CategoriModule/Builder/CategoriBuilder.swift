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
        view.presenter         = presenter
        presenter.listView     = view
        presenter.router       = router
        interactor.presenter   = presenter
        
        return view
    }
    
    func createUpdateView() -> CategoriUpdateController {
        
        let view        = CategoriUpdateController()
//        let presenter   = CategoriPresenter()
//        let interactor  = CategoriInteractor()
//        let router      = CategoriRouter()
//
//        // Setup
//        view.presenter         = presenter
//        presenter.listView     = view
//        presenter.router       = router
//        interactor.presenter   = presenter
        
        return view
    }
    
}
