//
//  ProductPresenter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

protocol ProductPresenterDelegate {
    func notifyDidLoad()
    func notifyWillAppear()
}

class ProductPresenter {
    weak var listView: ProductListController?
    weak var updateView: ProductUpdateController?
    var router: ProductRouterDelegate?
}


extension ProductPresenter: ProductPresenterDelegate {
    
    func notifyDidLoad() {
        
    }
    
    func notifyWillAppear() {
        
    }
    
    
}
