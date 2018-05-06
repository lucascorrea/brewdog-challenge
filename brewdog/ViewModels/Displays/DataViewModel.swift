//
//  DataViewModel.swift
//  brewdog
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

protocol DataViewModel {
    func name(indexPath: IndexPath) -> String
    func value(indexPath: IndexPath) -> String
    func extra(indexPath: IndexPath) -> String
    func state(indexPath: IndexPath) -> String
}
