//
//  NetworkClient.swift
//  brewdog
//
//  Created by Lucas Correa on 14/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

protocol NetworkClient {
    func request(router: BrewdogRouter, success: @escaping SuccessHandler, failure: @escaping FailureHandler)
}
