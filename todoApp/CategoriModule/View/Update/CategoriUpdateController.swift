//
//  CategoriUpdateController.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol CategoriUpdateControllerDelegate {
    func setupUI()
    func setupCategoriInto()
    func clearAndClose()
}

class CategoriUpdateController: UIViewController {
    
    //View elements
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var actionBtn: UIButton!
    
    let minValue: Int = 3
    var presenter: CategoriPresenterDelegate?
    var categoriItem: CategoriItem?
            
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Notify
        guard let presenter = presenter else { return }
        presenter.notifyUpdateViewWillAppear()
    }
    
    @IBAction func handleActionBtnTapped(_ sender: Any) {
        guard let presenter = presenter else { return }
        guard let categoriTitle = textField.text else { return }
        guard categoriTitle.count > minValue else { return }
        
        if self.categoriItem != nil { // Update
            guard var categoriItem = self.categoriItem else { return }
            categoriItem.title = categoriTitle
            presenter.updateCategori(categoriItem: categoriItem)
        } else { // Add
            let categoriItem = CategoriItem(categoriId: nil, title: categoriTitle)
            presenter.createCategori(categoriItem: categoriItem)
        }
    }
}

// MARK: CategoriUpdateControllerDelegate
extension CategoriUpdateController: CategoriUpdateControllerDelegate {
    
    func setupUI() {
        titleLabel.text = CategoriPage.updateLabelTitle
        textField.placeholder = CategoriPage.updatePlaceholderTitle
        actionBtn.setTitle(CategoriPage.updateButtonAddTitle, for: .normal)
    }
    
    func setupCategoriInto() {
        guard let categoriItem = categoriItem else { return }
        textField.text = categoriItem.title
        actionBtn.setTitle(CategoriPage.updateButtonUpdateTitle, for: .normal)
    }
    
    func clearAndClose(){
        textField.text = ""
        dismiss(animated: true, completion: nil)
    }
    
}
