//
//  CategoriRouter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol CategoriRouterDelegate {
    func navigateUpdatePage()
}

class CategoriRouter {
    
    weak var navigationController: UINavigationController?
}

// MARK: Router delegate
extension CategoriRouter: CategoriRouterDelegate {
    
    func navigateUpdatePage() {
        
    }
}
