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
    
    //
    // MARK: - Initializer
    init() {
        beerItems = [Beer]()
    }
    
    //
    // MARK: - Public Functions
    func list(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        let request = API.allBeers
        Network.request(target: request, success: { (response) in
            
            do {
                guard let data = response as? String else {
                    print("Error cast response to String")
                    return
                }
                
                let beers = try JSONDecoder().decode([Beer].self, from: data.data(using: .utf8)!)
                self.beerItems = beers
                success(beers as AnyObject)
            } catch let error {
                print(error)
                failure(nil, nil, error)
            }
            
        }, failure: { (response, object, error) in
            failure(response, object, error)
        })
    }
}
