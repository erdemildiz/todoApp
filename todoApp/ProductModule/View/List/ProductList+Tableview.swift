//
//  ProductList+Tableview.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

extension ProductListController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let productItems = productItems, productItems.count > 0 else { return 1 }
        return productItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let productItems = productItems, productItems.count > 0 else {
           let emptyStateCell = UITableViewCell()
           tableView.separatorStyle = .none
           emptyStateCell.textLabel?.text = ProductPage.emptyMessage
           emptyStateCell.textLabel?.textAlignment = .center
           return emptyStateCell
       }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductItemCell.cellIdentifier) as? ProductItemCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.delegate = self
        cell.productItemIndex = indexPath
        cell.productItem = productItems[indexPath.row]
       return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: CategoriPage.deleteActionTitle) { [weak self] (_, _, completionHandler) in
            guard let self = self else { return }
            guard let presenter = self.presenter else { return }
            guard let productItems = self.productItems else { return }
            let productItem = productItems[indexPath.row]
            presenter.deleteProduct(productItem: productItem)
            completionHandler(true)
        }
        let editAction = UIContextualAction(style: .normal, title: CategoriPage.updateButtonUpdateTitle) { [weak self]  (_, _, completionHandler) in
            guard let self = self else { return }
            guard let presenter = self.presenter else { return }
            guard let productItems = self.productItems else { return }
            let productItem = productItems[indexPath.row]
            presenter.navigateUpdatePage(productItem: productItem)
            completionHandler(true)
        }
        
        deleteAction.image = Icons.remove
        editAction.image   = Icons.edit
        let configuration  = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}
