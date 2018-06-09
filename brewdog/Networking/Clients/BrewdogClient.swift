//
//  BrewdogClient.swift
//  brewdog
//
//  Created by Lucas Correa on 14/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

public typealias SuccessHandler = (Any?) -> Void
public typealias FailureHandler = (URLResponse?, Any?, Error?) -> Void

class BrewdogClient: NetworkClient {
    
    func request(router: BrewdogRouter, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        var urlRequest = URLRequest(url: router.url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        urlRequest.httpMethod = router.method
        
        for (key, value) in router.headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if (error != nil) {
                failure(response, data, error)
            } else {
                if let json = data {
                    DispatchQueue.main.async {
                        let string = String(data: json, encoding: String.Encoding.utf8)
                        success(string ?? "")
                    }
                }
                
            }
            }.resume()
    }
}
