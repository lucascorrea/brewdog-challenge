//
//  Network.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

public typealias SuccessHandler = (Any?) -> Void
public typealias FailureHandler = (URLResponse?, Any?, Error?) -> Void

class Network {
    
    static func request(target: API, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        print(target.url)
        
        var urlRequest = URLRequest(url: target.url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        urlRequest.httpMethod = target.method
        
        for (key, value) in target.headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
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
        }
        task.resume()
    }
}
