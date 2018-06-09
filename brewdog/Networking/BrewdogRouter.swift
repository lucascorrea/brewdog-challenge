//
//  API.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

enum BrewdogRouter {
    case allBeers
    
    static var baseUrlString = "https://api.punkapi.com/v2/"
}

extension BrewdogRouter {
    
    var method: String {
        switch self {
        case .allBeers:
            return "GET"
        }
    }
    var path: String {
        switch self {
        case .allBeers:
            return "beers"
        }
    }
    var headers: [String: String] {
        return [:]
    }
    var parameters: [String: Any] {
        return [:]
    }
    var url: URL {
        switch self {
        case .allBeers:
            return URL(string: "\(BrewdogRouter.baseUrlString)\(path)")!
        }
    }
}
