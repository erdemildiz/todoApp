//
//  CategoriListController.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol CategoriListControllerDelegate {
    func prepareNavigationBar()
    func reloadTableView()
}

class CategoriListController: UITableViewController {
    
    var presenter: CategoriPresenterDelegate?
    var categoriList: [CategoriItem]?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let presenter = presenter else { return }
        presenter.notifyDidLoad()
    }
    
    @objc
    fileprivate func handleAddBtnTapped() {
        guard let presenter = presenter else { return }
        presenter.navigateUpdatePage(categoriItem: nil)
    }
}

extension CategoriListController: CategoriListControllerDelegate {
    
    func prepareNavigationBar(){
        title = CategoriPage.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Icons.add, style: .done, target: self, action: #selector(handleAddBtnTapped))
        
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}
