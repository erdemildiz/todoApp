//
//  ProductListController.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol ProductListControllerDelegate {
    func prepareNavigationBar()
    func registerCell()
    func reloadTableView()
    func reloadTableRow(indexPath: IndexPath)
}

class ProductListController: UITableViewController {

    var presenter: ProductPresenterDelegate?
    var productItem: ProductItem?
    var productItems: [ProductItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let presenter = presenter else { return }
        presenter.notifyDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc
    fileprivate func handleAddBtnTapped() {
        guard let presenter = presenter else { return }
        presenter.navigateUpdatePage(productItem: productItem)
    }    
}

// MARK: ProductListControllerDelegate
extension ProductListController: ProductListControllerDelegate {
    
    func prepareNavigationBar(){
        title = ProductPage.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Icons.add, style: .done, target: self, action: #selector(handleAddBtnTapped))
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: ProductItemCell.nibName, bundle: nil), forCellReuseIdentifier: ProductItemCell.cellIdentifier)
    }
    
    func reloadTableView(){
        tableView.reloadData()
    }
    
    func reloadTableRow(indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

//MARK: ProductItem Fav Tapped
extension ProductListController: ProductItemTappedFavIconDelegate {
    
    func didTapped(productItem: ProductItem, productItemIndex: IndexPath) {
        guard let presenter = presenter else { return }
        presenter.changeFavStatus(productItem: productItem, productItemIndex: productItemIndex)        
    }
    
}
