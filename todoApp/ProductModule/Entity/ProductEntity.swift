//
//  ProductEntity.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation
import RealmSwift

struct ProductItemPrimaryKey {
    static let primaryKey = "productId"
}

struct ProductItem {
    let productId: Int?
    var name: String
    var description: String
    var price: String
    var imageUrl: String
    let categoriId: Int
    var isFavourite: Bool
}


class Product: Object {
    @objc dynamic var productId = 0
    @objc dynamic var name: String = ""
    @objc dynamic var subdescription: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var categoriId: Int = 0
    @objc dynamic var isFavourite: Bool = false
    
    override class func primaryKey() -> String? {
        return "productId"
    }
}
