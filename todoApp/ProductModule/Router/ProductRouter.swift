//
//  ProductRouter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol ProductRouterDelegate {
    func navigateUpdatePage()
}

class ProductRouter {
    weak var navigation: UINavigationController?
}

// MARK: Router delegate
extension ProductRouter: ProductRouterDelegate {
    
    func navigateUpdatePage() {
        
    }
    
    
}
