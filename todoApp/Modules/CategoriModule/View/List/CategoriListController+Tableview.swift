//
//  CategoriListController+Tableview.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

extension CategoriListController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let categoriList = categoriList, categoriList.count > 0 else { return 1 }
        return categoriList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoriList = categoriList, categoriList.count > 0 else {
            let emptyStateCell = UITableViewCell()
            tableView.separatorStyle = .none
            emptyStateCell.textLabel?.text = CategoriPage.emptyMessage
            emptyStateCell.textLabel?.textAlignment = .center
            return emptyStateCell
        }
        let cell = UITableViewCell()
        tableView.separatorStyle = .singleLine
        cell.selectionStyle = .none
        cell.textLabel?.text = categoriList[indexPath.row].title        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = self.presenter else { return }
        presenter.navigateProductPage(indexPath: indexPath)
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: CategoriPage.deleteActionTitle) { [weak self] (_, _, completionHandler) in
            guard let self = self else { return }
            guard let presenter = self.presenter else { return }
            guard let categoriList = self.categoriList else { return }
            presenter.deleteCategori(categoriItem: categoriList[indexPath.row])
            completionHandler(true)
        }
        let editAction = UIContextualAction(style: .normal, title: CategoriPage.updateButtonAddTitle) { [weak self]  (_, _, completionHandler) in
            guard let self = self else { return }
            guard let presenter = self.presenter else { return }
            guard let categoriList = self.categoriList else { return }
            let categoriItem = categoriList[indexPath.row]
            presenter.navigateUpdatePage(categoriItem: categoriItem)
            completionHandler(true)
        }
        
        deleteAction.image = Icons.remove
        editAction.image   = Icons.edit
        let configuration  = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}
