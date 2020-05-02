//
//  ProductEntity.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation
import RealmSwift

struct ProductItem {
    let productId: Int?
    let name: String
    let description: String
    let price: Float
    let imageUrl: String
    let categori: CategoriItem
    let isInFavourite: Bool
}


class Product: Object {
    @objc dynamic var productId = 0
    @objc dynamic var name: String = ""
    @objc dynamic var subDescription: String = ""
    @objc dynamic var price: Float = 0.0
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var category: Categori?
    @objc dynamic var isFavourite: Bool = false
    
    override class func primaryKey() -> String? {
        return "productId"
    }
}
