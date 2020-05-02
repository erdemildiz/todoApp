//
//  StorageManager.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation
import RealmSwift

class StorageManager {
    
    lazy var realm: Realm = {
        let realm = try! Realm()
        return realm
    }()
        
    // MARK: Add
    func add(object: Object){
        do {
            try self.realm.write {
             self.realm.add(object)
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
    }
    
    // MARK: Delete
    func delete(object: Object) {
        do {
            try self.realm.write {
             self.realm.delete(object)
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    // MARK: Update
    func update(object: Object.Type, newValue: [String: Any]) {
        do {
           try self.realm.write {
            self.realm.create(object, value: newValue, update: .modified)
           }
       } catch let error {
           fatalError(error.localizedDescription)
       }
        
    }
    
    func increasePrimaryKey(object: Object.Type, primaryKey: String) -> Int {
        return (self.realm.objects(object).max(ofProperty: primaryKey) as Int? ?? 0) + 1
    }
    
}
