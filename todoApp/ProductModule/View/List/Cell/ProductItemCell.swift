//
//  ProductItemCell.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 2.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol ProductItemTappedFavIconDelegate {
    func didTapped(productItem: ProductItem, productItemIndex: IndexPath)
}

class ProductItemCell: UITableViewCell {
    
    static let nibName = "ProductItemCell"
    static let cellIdentifier = "ProductItemCellIdentifier"
    
    var delegate: ProductItemTappedFavIconDelegate?
    var productItemIndex: IndexPath?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var productItem: ProductItem? {
        didSet {
            setProductItemInfo()
            setFavouriteIconStatus()
        }
    }
    
    fileprivate func setProductItemInfo() {
        guard let productItem = productItem else { return }
        productImage.setImage(imageUrl: productItem.imageUrl)
        productTitleLabel.text = productItem.name
        productDescriptionLabel.text = productItem.description
        productPriceLabel.text = "₺\(productItem.price)"
    }
    
    fileprivate func setFavouriteIconStatus(){
        guard let productItem = productItem else { return }
        if (productItem.isFavourite) {
            favouriteButton.imageView?.tintColor = .blue
            favouriteButton.setImage(Icons.star, for: .normal)
        } else {
            favouriteButton.imageView?.tintColor = .black
            favouriteButton.setImage(Icons.starBlank, for: .normal)
        }
    }
        
    @IBAction func handleTappedFavouriteBtn(_ sender: Any) {
        guard let productItem = productItem else { return }
        guard let delegate = delegate else { return }
        guard let productItemIndex = productItemIndex else { return }
        delegate.didTapped(productItem: productItem, productItemIndex: productItemIndex)
    }
    
}
