//
//  ProductRouter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol ProductRouterDelegate {
    func navigateUpdatePage(productItem: ProductItem?, presenter: ProductPresenter)
    func setNavigationController(navigationController: UINavigationController)
}

class ProductRouter {
    weak var navigationController: UINavigationController?
}

// MARK: Router delegate
extension ProductRouter: ProductRouterDelegate {
    
    func setNavigationController(navigationController: UINavigationController) {
       self.navigationController = navigationController
    }
    
    func navigateUpdatePage(productItem: ProductItem?, presenter: ProductPresenter) {
        guard let navigationController = navigationController else { return }
        guard let updateView = presenter.updateView else { return }
        updateView.productItem = productItem
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.present(updateView, animated: true, completion: nil)
    }
    
    
}
