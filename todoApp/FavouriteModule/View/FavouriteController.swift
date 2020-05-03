//
//  FavouriteController.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol FavouriteControllerDelegate {
    func addObserver()
    func reloadTableView()
}

class FavouriteController: UITableViewController {
    
    var presenter: FavouritePresenterDelegate?
    var favItems: [FavItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let presenter = presenter else { return }
        presenter.notifyDidLoad()
    }
    
    @objc
    func handleChangeFavStatus() {
        guard let presenter = presenter else { return }
        presenter.favListChanged()
    }
}

// MARK: FavouriteControllerDelegate
extension FavouriteController: FavouriteControllerDelegate {
    
    func setPageTitle() {
        title = FavouritePage.title
    }
        
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleChangeFavStatus), name: NSNotification.Name("FAV_LIST_CHANGED"), object: nil)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}
