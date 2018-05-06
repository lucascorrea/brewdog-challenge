//
//  BeerDetailViewModel.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class BeerDetailViewModel {

    //
    // MARK: - Properties
    var beer: Beer
    
    //
    // MARK: - Initializer
    init() {
        beer = Beer()
    }
    
    func beerName() -> String {
        return beer.name ?? ""
    }
    
    func beerImageUrl() -> String {
        return beer.imageUrl ?? ""
    }
    
    func beerDetail() -> String {
        return beer.description ?? ""
    }
    
    func beerAbv() -> String {
        return "\(beer.abv ?? 0.0)%"
    }
}
