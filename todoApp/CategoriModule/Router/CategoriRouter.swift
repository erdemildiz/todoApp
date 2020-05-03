//
//  CategoriRouter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol CategoriRouterDelegate {
    func setNavigationController(navigationController: UINavigationController)
    func navigateUpdatePage(categoriItem: CategoriItem?, presenter: CategoriPresenter)
    func navigateProductPage(view: UIViewController, categoriItem: CategoriItem)
}

class CategoriRouter {
    
    weak var navigationController: UINavigationController?
}

// MARK: Router delegate
extension CategoriRouter: CategoriRouterDelegate {
    
    func setNavigationController(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateUpdatePage(categoriItem: CategoriItem?, presenter: CategoriPresenter) {
        guard let navigationController = navigationController else { return }
        guard let updateView = presenter.updateView else { return }
        updateView.categoriItem = categoriItem
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.present(updateView, animated: true, completion: nil)
    }
    
    func navigateProductPage(view: UIViewController, categoriItem: CategoriItem) {
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(view, animated: true)
    }
}
