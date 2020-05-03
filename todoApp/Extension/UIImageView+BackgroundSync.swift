//
//  UIImageView+BackgroundSync.swift
//  todoApp
//
//  Created by Erdem ILDIZ on 2.05.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(imageUrl: String) {
        guard let url = URL(string: imageUrl), !imageUrl.isEmpty else { return }
        do {
            let imageData = try Data(contentsOf: url)
            DispatchQueue.main.async { [weak self] in
                guard let image = UIImage(data: imageData) else { return }
                self?.image = image
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
