//
//  BrewdogListService.swift
//  brewdog
//
//  Created by Lucas Correa on 14/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

class BrewdogListService: Service {
    
    var client: NetworkClient
    
    required init(client: NetworkClient) {
        self.client = client
    }
    
    func beerList(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        
        client.request(router: BrewdogRouter.allBeers, success: { (response) in
            do {
                guard let data = response as? String else {
                    print("Error cast response to String")
                    return
                }
                
                let beers = try JSONDecoder().decode([Beer].self, from: data.data(using: .utf8)!)
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
