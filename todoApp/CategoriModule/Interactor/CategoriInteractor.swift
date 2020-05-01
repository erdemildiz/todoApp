//
//  CategoriInteractor.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

protocol CategoriInteractorDelegate {
    func fetchCategorList()
}

class CategoriInteractor {
    
    var presenter: CategoriPresenterDelegate?
}

extension CategoriInteractor: CategoriInteractorDelegate {
    
    func fetchCategorList() {
        
    }
}
