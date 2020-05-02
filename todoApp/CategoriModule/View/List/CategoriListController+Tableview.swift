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
        guard let categoriList = categoriList else { return 1 }
        return categoriList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoriList = categoriList else {
            let emptyStateCell = UITableViewCell()
            tableView.separatorStyle = .none
            emptyStateCell.textLabel?.text = CategoriPage.emptyMessage
            emptyStateCell.textLabel?.textAlignment = .center
            return emptyStateCell
        }
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = categoriList[indexPath.row].title        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let categoriList = categoriList else { return }
        guard let presenter = presenter else { return }
        let categoriItem = categoriList[indexPath.row]
        presenter.navigateUpdatePage(categoriItem: categoriItem)
    }
}
