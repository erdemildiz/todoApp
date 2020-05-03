//
//  CategoriPresenter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

protocol CategoriPresenterDelegate {
    // Lifecycle
    func notifyDidLoad()
    func notifyUpdateViewWillAppear()
    // Data
    func fetchedCategoriList(categorList: [CategoriItem])
    func createCategori(categoriItem: CategoriItem)
    func updateCategori(categoriItem: CategoriItem)
    func deleteCategori(categoriItem: CategoriItem)
    // Router
    func navigateUpdatePage(categoriItem: CategoriItem?)
    func navigateProductPage(indexPath: IndexPath)
}

class CategoriPresenter {
    weak var listView: CategoriListController?
    var updateView: CategoriAddUpdateController?
    var  router: CategoriRouterDelegate?
    var interactor: CategoriInteractorDelegate?
}

// MARK: Lifecycle - UI
extension CategoriPresenter: CategoriPresenterDelegate {
    
    func notifyDidLoad() {
        guard let listView = listView else { return }
        guard let router   = router else { return }
        guard let navigationController = listView.navigationController else { return }
        listView.prepareNavigationBar()
        router.setNavigationController(navigationController: navigationController)
        // Fetch data
        fetchCategoriList()
        createAndSetUpdateView()
    }
    
    func notifyUpdateViewWillAppear() {
        guard let updateView = updateView else { return }
        updateView.setupUI()
        updateView.setupCategoriInto()
    }
    
    fileprivate func createAndSetUpdateView(){
        let categoriBuilder = CategoriBuilder()
        let updateView = categoriBuilder.createUpdateView(categoriItem: nil)
        updateView.presenter = self
        self.updateView = updateView
    }
}


// MARK: Data
extension CategoriPresenter {
    
    func fetchCategoriList() {
        guard let interactor = interactor else { return }
        interactor.fetchCategorList()
    }
    
    func fetchedCategoriList(categorList: [CategoriItem]) {
        guard let listView = listView else { return }
        listView.categoriList = categorList
        listView.reloadTableView()
    }
    
    func createCategori(categoriItem: CategoriItem){
        guard let interactor = interactor else { return }
        guard let updateView = updateView else { return }
        interactor.createCategori(categoriItem: categoriItem)
        fetchCategoriList()
        updateView.clearAndClose()
        
    }
    
    func updateCategori(categoriItem: CategoriItem){
        guard let interactor = interactor else { return }        
        interactor.updateCategori(categoriItem: categoriItem)
        interactor.fetchCategorList()
    }
    
    func deleteCategori(categoriItem: CategoriItem) {
        guard let interactor = interactor else { return }
        interactor.deleteCategori(categoriItem: categoriItem)
        interactor.fetchCategorList()
    }
}

// MARK: Router
extension CategoriPresenter {
    
    func navigateUpdatePage(categoriItem: CategoriItem?) {
        guard let router = router else { return }
        if let categoriItem = categoriItem { // Update
            router.navigateUpdatePage(categoriItem: categoriItem, presenter: self)
        } else { // Create
            router.navigateUpdatePage(categoriItem: nil, presenter: self)
        }
    }
    
    func navigateProductPage(indexPath: IndexPath) {
        guard let router   = router else { return }
        guard let listView = listView else { return }
        guard let categoriList = listView.categoriList else { return }
        let categoriItem = categoriList[indexPath.row]
        let productBuilder  = ProductBuilder()
        let productListView = productBuilder.createListView(categoriItem: categoriItem)
        router.navigateProductPage(view: productListView, categoriItem: categoriItem)
    }
}

