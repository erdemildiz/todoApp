//
//  ProductPresenter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

protocol ProductInteractorDelegate {
    func createProduct(productItem: ProductItem, categoriItem: CategoriItem, complete: @escaping (() -> Void))
    func fetchProducts(categoriId: Int)
    func updateProduct(productItem: ProductItem)
    func deleteProduct(productItem: ProductItem)
    func changeFavStatus(productItem: ProductItem)
}

class ProductInteractor {
    var presenter: ProductPresenterDelegate?
    private var categories: [Categori]?
    lazy var storageManager: StorageManager? = {
        let manager = StorageManager()
        return manager
    }()
}

// MARK:  Interactor Delegate
extension ProductInteractor: ProductInteractorDelegate {
    
    func createProduct(productItem: ProductItem, categoriItem: CategoriItem, complete: @escaping (() -> Void)) {
        guard let storageManager = self.storageManager else { return }
        guard let categoriId = categoriItem.categoriId else { return }
        let newProductId = storageManager.increasePrimaryKey(object: Product.self, primaryKey: ProductItemPrimaryKey.primaryKey)
        let storageObject = Product()
        storageObject.productId = newProductId
        storageObject.name = productItem.name
        storageObject.subdescription = productItem.description
        storageObject.price = productItem.price
        storageObject.imageUrl = productItem.imageUrl
        storageObject.categoriId = categoriId
        storageObject.isFavourite = productItem.isFavourite
        storageManager.add(object: storageObject)
        complete()
    }
    
    func fetchProducts(categoriId: Int) {
       guard let storageManager = self.storageManager else { return }
       guard let presenter = presenter else { return }
       var productItems = [ProductItem]()
       let items = storageManager.realm.objects(Product.self).filter("categoriId == \(categoriId)")
       for item  in items {
           productItems.append(
            ProductItem(
                productId: item.productId,
                name: item.name,
                description: item.subdescription,
                price: item.price,
                imageUrl: item.imageUrl,
                categoriId: item.categoriId,
                isFavourite: item.isFavourite
            )
        )
       }
       presenter.fetchedProductList(productItems: productItems)
    }
    
    func updateProduct(productItem: ProductItem) {
        guard let storageManager = self.storageManager else { return }
        guard let productId = productItem.productId else { return }
        let updatedProductItem = [
            "productId": productId,
            "name": productItem.name,
            "subdescription": productItem.description,
            "price": productItem.price,
            "imageUrl": productItem.imageUrl
        ] as [String : Any]
        storageManager.update(object: Product.self, newValue: updatedProductItem)
    }
    
    func deleteProduct(productItem: ProductItem) {
        guard let storageManager = self.storageManager else { return }
        guard let productId = productItem.productId else { return }
        storageManager.delete(object: Product.self, item: (primaryKey: ProductItemPrimaryKey.primaryKey, index: productId))
        
    }
    
    func changeFavStatus(productItem: ProductItem) {
        guard let storageManager = self.storageManager else { return }
        guard let productId = productItem.productId else { return }
        let updatedItem = [
            "productId": productId,
            "isFavourite": !productItem.isFavourite
        ] as [String : Any]
        storageManager.update(object: Product.self, newValue: updatedItem)
    }
    
}
