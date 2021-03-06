//
//  ProductPresenter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

protocol ProductPresenterDelegate {
    // Lifecycle
    func notifyDidLoad()
    func notifyUpdateViewWillAppear()
    // Date
    func fetchedProductList(productItems: [ProductItem])
    func createProduct()
    func updateProduct(productItem: ProductItem)
    func deleteProduct(productItem: ProductItem)
    func changeFavStatus(productItem: ProductItem, productItemIndex: IndexPath)
    // Router
    func navigateUpdatePage(productItem: ProductItem?)
}

class ProductPresenter {
    weak var listView: ProductListController?
    var updateView: ProductAddUpdateController?
    var router: ProductRouterDelegate?
    var interactor: ProductInteractorDelegate?
    var categoriItem: CategoriItem?
    
    fileprivate func createAndSetUpdateView(){
       let productBuilder = ProductBuilder()
       let updateView = productBuilder.createUpdateView(productItem: nil)
       updateView.presenter = self
       self.updateView = updateView
    }
}


// MARK: Lifecycle - UI
extension ProductPresenter: ProductPresenterDelegate {
    
    func notifyDidLoad() {
        guard let listView = listView else { return }
        guard let router   = router else { return }
        guard let navigationController = listView.navigationController else { return }
        listView.prepareNavigationBar()
        listView.registerCell()
        router.setNavigationController(navigationController: navigationController)
        // Fetch data
        fetchProductList()
        createAndSetUpdateView()
    }
    
    func notifyUpdateViewWillAppear() {
        guard let updateView = updateView else { return }
        updateView.setupUI()
        updateView.setProductInfo()
    }
}

//MARK: Data
extension ProductPresenter {
    
    fileprivate func fetchProductList() {
       guard let interactor = interactor else { return }
       guard let categoriItem = categoriItem else { return }
       guard let categoriId = categoriItem.categoriId else { return }
       interactor.fetchProducts(categoriId: categoriId)
    }
    
    func fetchedProductList(productItems: [ProductItem]) {
        guard let listView = listView else { return }
        listView.productItems = productItems
        listView.reloadTableView()
    }
    
    func createProduct() {
        guard let interactor = interactor else { return }
        guard let updateView = updateView else { return }
        guard let categoriItem = categoriItem else { return }
        guard let categoriId = categoriItem.categoriId else { return }
        let productItem = ProductItem(
           productId: nil,
           name: updateView.titleTextField.text ?? "",
           description: updateView.descTextField.text ?? "",
           price: updateView.priceTextField.text ?? "",
           imageUrl: updateView.imageTextField.text ?? "",
           categoriId: categoriId,
           isFavourite: false
        )
        interactor.createProduct(productItem: productItem, categoriItem: categoriItem) { [weak self] in
            guard let self = self else { return }
            guard let updateView = self.updateView else { return }
            self.fetchProductList()
            updateView.clear()
            updateView.close()
        }
    }
    
    func updateProduct(productItem: ProductItem) {
        guard let interactor = interactor else { return }
        guard let updateView = updateView else { return }
        interactor.updateProduct(productItem: productItem)
        updateView.clear()
        updateView.close()
        fetchProductList()
    }
    
    func deleteProduct(productItem: ProductItem) {
        guard let interactor = interactor else { return }
        interactor.deleteProduct(productItem: productItem)
        fetchProductList()
    }
    
    func changeFavStatus(productItem: ProductItem, productItemIndex: IndexPath) {
        guard let interactor = interactor else { return }
        guard let listView = listView else { return }
        interactor.changeFavStatus(productItem: productItem)
        listView.productItems![productItemIndex.row].isFavourite = !listView.productItems![productItemIndex.row].isFavourite
        listView.reloadTableRow(indexPath: productItemIndex)
        NotificationCenter.default.post(name: NSNotification.Name("FAV_LIST_CHANGED"), object: nil)
    }
}



//MARK: Router
extension ProductPresenter {
    
    func navigateUpdatePage(productItem: ProductItem?) {
        guard let router = router else { return }
        if let productItem = productItem { // Update
            router.navigateUpdatePage(productItem: productItem, presenter: self)
        } else { // Create            
            router.navigateUpdatePage(productItem: nil, presenter: self)
        }
    }
}
