//
//  Constats.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 1.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

// MARK: Tabbar
struct Tabbar {
    static let firstTabbar              = NSLocalizedString("categories", comment: "")
    static let secondTabbar             = NSLocalizedString("favourites", comment: "")
}

// MARK: Categori
struct CategoriPage {
    static let title                     = NSLocalizedString("categori_page_title", comment: "")
    static let emptyMessage              = NSLocalizedString("categori_empty_message", comment: "")
    static let updateLabelTitle          = NSLocalizedString("categori_update_title", comment: "")
    static let updatePlaceholderTitle    = NSLocalizedString("categori_update_placeholder_title", comment: "")
    static let updateButtonAddTitle      = NSLocalizedString("categori_update_button_add_title", comment: "")
    static let updateButtonUpdateTitle   = NSLocalizedString("categori_update_button_update_title", comment: "")
    static let deleteActionTitle         = NSLocalizedString("categori_update_button_delete_title", comment: "")
}

// MARK: Product
struct ProductPage {
    static let title                     = NSLocalizedString("product_page_title", comment: "")
    static let emptyMessage              = NSLocalizedString("product_empty_message", comment: "")
    static let updateLabelTitle          = NSLocalizedString("product_update_title", comment: "")
    static let updateButtonAddTitle      = NSLocalizedString("product_update_button_add_title", comment: "")
    static let updateButtonUpdateTitle   = NSLocalizedString("product_update_button_update_title", comment: "")
    static let deleteActionTitle         = NSLocalizedString("product_update_button_delete_title", comment: "")
    static let imageUrl                  = NSLocalizedString("product_update_image_url_label", comment: "")
    static let productTitle              = NSLocalizedString("product_update_title_label", comment: "")
    static let description               = NSLocalizedString("product_update_description_label", comment: "")
    static let price                     = NSLocalizedString("product_update_price_label", comment: "")    
}

// MARK: Favourite
struct FavouritePage {
    static let title                     = NSLocalizedString("favourite_page_title", comment: "")
    static let emptyMessage              = NSLocalizedString("favourite_empty_message", comment: "")
}

// MARK: Common
struct Common {
    static let placeholderImageUrl       = NSLocalizedString("placeholder_image_url", comment: "")
}
