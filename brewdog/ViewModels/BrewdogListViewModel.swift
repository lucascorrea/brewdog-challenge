//
//  BrewdogListViewModel.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class BrewdogListViewModel {
    
    //
    // MARK: - Properties
    var beerItems: [Beer] {
        didSet {
            beerItems.sort { beer1, beer2  in
                return beer1.name! < beer2.name!
            }
        }
    }
    
    var service: BrewdogListService
    
    //
    // MARK: - Initializer
    init(service: BrewdogListService = BrewdogListService(client: BrewdogClient())) {
        self.service = service
        self.beerItems = [Beer]()
    }
    
    //
    // MARK: - Public Functions
    func list(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        service.beerList(success: { (beers) in
            self.beerItems = (beers as? [Beer])!
            success(beers as AnyObject)
        }, failure: { (response, object, error) in
            failure(response, object, error)
        })
    }
}
