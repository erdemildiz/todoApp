//
//  ProductUpdateControllerViewController.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol ProductUpdateControllerDelegate {
    func setupUI()
    func setProductInfo()
    func clear()
    func close()
}

class ProductAddUpdateController: UIViewController {
    
    @IBOutlet weak var updatePageTitleLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var imageTextFieldlabel: UILabel!
    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var titleTextFieldlabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextFieldlabel: UILabel!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var priceTextFieldlabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    var presenter: ProductPresenterDelegate?
    var productItem: ProductItem?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let presenter = presenter else { return }
        presenter.notifyUpdateViewWillAppear()
    }
    
    fileprivate func addGesture() {
        let tappGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTappedView))
        self.view.addGestureRecognizer(tappGestureRecognizer)
    }
    
    
    @IBAction func handleSubmitButtonTapped(_ sender: Any) {
        guard let presenter = presenter else { return }        
        if var productItem = productItem  { // Update
            productItem.name         = titleTextField.text ?? ""
            productItem.description  = descTextField.text ?? ""
            productItem.price        = priceTextField.text ?? ""
            productItem.imageUrl     = imageTextField.text ?? ""
            presenter.updateProduct(productItem: productItem)
        } else { // Add
            presenter.createProduct()
        }
    }
    
    @objc
    fileprivate func handleTappedView(){
        imageTextField.endEditing(true)
        titleTextField.endEditing(true)
        descTextField.endEditing(true)
        priceTextField.endEditing(true)
    }
}

// MARK: ProductUpdateControllerDelegate
extension ProductAddUpdateController: ProductUpdateControllerDelegate {
    
    func setupUI(){
        updatePageTitleLabel.text = ProductPage.title
        imageTextFieldlabel.text  = ProductPage.imageUrl
        titleTextFieldlabel.text  = ProductPage.productTitle
        descTextFieldlabel.text   = ProductPage.description
        priceTextFieldlabel.text  = ProductPage.price
        submitBtn.setTitle(ProductPage.updateButtonAddTitle, for: .normal)
        productImage.setImage(imageUrl: Common.placeholderImageUrl)
        addGesture()
    }
    
    func setProductInfo() {
       guard let productItem = productItem else {
            clear()
            return
        }
       imageTextField.text   = productItem.imageUrl
       titleTextField.text   = productItem.name
       descTextField.text    = productItem.description
       priceTextField.text   = productItem.price
       productImage.setImage(imageUrl: productItem.imageUrl)
       submitBtn.setTitle(ProductPage.updateButtonUpdateTitle, for: .normal)
    }
    
    func clear(){
       imageTextField.text   = ""
       titleTextField.text   = ""
       descTextField.text    = ""
       priceTextField.text   = ""
    }
    
    func close() {
        dismiss(animated: true, completion: nil)
    }
}
