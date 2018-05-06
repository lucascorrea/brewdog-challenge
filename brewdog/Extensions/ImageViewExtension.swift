//
//  ImageDownload.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

extension UIImageView {
    
    //
    // MARK: - Functions
    func setImage(withUrl url: String) {
        self.image = UIImage(named: "BeerEmpty")
        ImageDownload.shared.downloadImageFrom(urlString: url) { (image) in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
