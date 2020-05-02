//
//  CategoriInteractor.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation
import RealmSwift

protocol CategoriInteractorDelegate {
    func createCategori(categoriItem: CategoriItem, complete: @escaping (() -> Void))
    func updateCategori(categoriItem: CategoriItem)
    func deleteCategori(categoriItem: CategoriItem)
    func fetchCategorList()
}

class CategoriInteractor {
    
    var presenter: CategoriPresenterDelegate?
    lazy var storageManage: StorageManager? = {
        let manager = StorageManager()
        return manager
    }()
}

extension CategoriInteractor: CategoriInteractorDelegate {
    
    func createCategori(categoriItem: CategoriItem, complete: @escaping (() -> Void)) {
        guard let storageManager = self.storageManage else { return }
        let storageObject = Categori()
        storageObject.title = categoriItem.title
        storageObject.categoriId = storageManager.increasePrimaryKey(object: Categori.self, primaryKey: "categoriId")
        storageManager.add(object: storageObject)
        complete()
    }
    
    func fetchCategorList()  {
        guard let storageManager = self.storageManage else { return }
        guard let presenter = presenter else { return }
        var categorItems = [CategoriItem]()
        let items = storageManager.realm.objects(Categori.self)
        for item  in items {
            categorItems.append(CategoriItem(categoriId: item.categoriId, title: item.title))
        }
        presenter.fetchedCategoriList(categorList: categorItems)
    }
    
    func updateCategori(categoriItem: CategoriItem) {
        guard let storageManager = self.storageManage else { return }
        guard let categoriId = categoriItem.categoriId else { return }
        let updatedCategori = ["title": categoriItem.title, "categoriId": categoriId] as [String : Any]
        storageManager.update(object: Categori.self, newValue: updatedCategori)
    }
    
    func deleteCategori(categoriItem: CategoriItem) {
        guard let storageManager = self.storageManage else { return }
        guard let categoriId = categoriItem.categoriId else { return }
        storageManager.delete(object: Categori.self, item: (primaryKey: "categoriId", index: categoriId))
    }
}
