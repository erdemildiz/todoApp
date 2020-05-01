//
//  CategoriListController.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol CategoriListControllerDelegate {
    func reloadTableView()
}

class CategoriListController: UITableViewController {
    
    var presenter: CategoriPresenterDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let presenter = presenter else { return }
        presenter.notifyDidLoad()
    }
}

extension CategoriListController: CategoriListControllerDelegate {
    
    func reloadTableView() {
        
    }
}
