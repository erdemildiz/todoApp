//
//  ProductItemCell.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 2.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

class ProductItemCell: UITableViewCell {
    
    static let nibName = "ProductItemCell"
    static let cellIdentifier = "ProductItemCellIdentifier"

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var prodcutItem: ProductItem? {
        didSet {
            setProductItemInfo()
            setFavouriteIconVisibileStatus()
        }
    }
    
    fileprivate func setProductItemInfo() {
        guard let prodcutItem = prodcutItem else { return }
        productImage.setImage(imageUrl: prodcutItem.imageUrl)
        productTitleLabel.text = prodcutItem.name
        productDescriptionLabel.text = prodcutItem.description
        productPriceLabel.text = "₺\(prodcutItem.price)"
    }
    
    fileprivate func setFavouriteIconVisibileStatus(){
        guard let prodcutItem = prodcutItem else { return }
        if (prodcutItem.isFavourite) {
            favouriteButton.isHidden = false
        } else {
            favouriteButton.isHidden = true
        }
    }
        
    @IBAction func handleTappedFavouriteBtn(_ sender: Any) {
        
    }
    
}
