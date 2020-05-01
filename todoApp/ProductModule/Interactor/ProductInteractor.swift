//
//  ProductPresenter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

protocol ProductInteractorDelegate {
    func fetchProductInfo()
}

class ProductInteractor {
    var presenter: ProductPresenterDelegate?
}

// MARK:  Interactor Delegate
extension ProductInteractor: ProductInteractorDelegate {
    
    func fetchProductInfo() {
        
    }
    
    
}
