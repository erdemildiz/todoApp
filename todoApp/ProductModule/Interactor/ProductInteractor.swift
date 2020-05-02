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
    func fetchProducts()
}

class ProductInteractor {
    var presenter: ProductPresenterDelegate?
    private var categories: [Categori]?
    lazy var storageManage: StorageManager? = {
        let manager = StorageManager()
        return manager
    }()
}

// MARK:  Interactor Delegate
extension ProductInteractor: ProductInteractorDelegate {
    
    func createProduct(productItem: ProductItem, categoriItem: CategoriItem, complete: @escaping (() -> Void)) {
        guard let storageManager = self.storageManage else { return }
        guard let categoriId = categoriItem.categoriId else { return }
        let newProductId = storageManager.increasePrimaryKey(object: Product.self, primaryKey: "productId")
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
    
    func fetchProducts() {
       guard let storageManager = self.storageManage else { return }
       guard let presenter = presenter else { return }
       var productItems = [ProductItem]()
       let items = storageManager.realm.objects(Product.self)
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
    
    
}
