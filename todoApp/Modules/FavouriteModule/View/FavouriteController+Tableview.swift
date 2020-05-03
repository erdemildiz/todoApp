//
//  FavouriteController+Tableview.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

extension FavouriteController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let favItems = favItems, favItems.count > 0 else { return 1 }
        return favItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let favItems = favItems, favItems.count > 0 else {
            let emptyStateCell = UITableViewCell()
            tableView.separatorStyle = .none
            emptyStateCell.textLabel?.text = FavouritePage.emptyMessage
            emptyStateCell.textLabel?.textAlignment = .center
            return emptyStateCell
        }
        let cell = UITableViewCell()
        tableView.separatorStyle = .singleLine
        cell.selectionStyle = .none
        cell.textLabel?.text = favItems[indexPath.row].title        
        return cell
    }


}
