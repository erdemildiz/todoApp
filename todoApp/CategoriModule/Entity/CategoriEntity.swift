//
//  CategoriEntity.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation
import RealmSwift

struct CategoriItem {
    let categoriId: Int?
    var title: String
}

class Categori: Object {
    @objc dynamic var categoriId = 0
    @objc dynamic var title: String = ""
    
    override class func primaryKey() -> String? {
        return "categoriId"
    }
}
