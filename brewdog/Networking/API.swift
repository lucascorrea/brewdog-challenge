//
//  API.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

enum API {
    case allBeers
}

extension API {
    var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2/")!
    }
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
        switch self {
        default :
            return [:]
        }
    }
    var url: URL {
        switch self {
        case .allBeers:
            return URL(string: "\(baseURL)\(path)")!
        }
    }
}
