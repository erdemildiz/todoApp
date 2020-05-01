//
//  CategoriPresenter.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

protocol CategoriPresenterDelegate {
    func notifyDidLoad()
    func notifyWillAppear()
    func fetchCategoriList()
    func fetchedSuccess()
    func fetchedError()
}

class CategoriPresenter {
    weak var listView: CategoriListController?
    weak var updateView: CategoriUpdateController?
    var router: CategoriRouterDelegate?
}


extension CategoriPresenter: CategoriPresenterDelegate {
    
    // MARK: Lifecycle
    func notifyDidLoad() {
        
    }
    
    func notifyWillAppear() {
        
    }
    
    // MARK: Fetch Data
    func fetchCategoriList() {
        
    }
    
    func fetchedSuccess() {
        
    }
    
    func fetchedError() {
        
    }
    
}
