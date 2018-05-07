//
//  Malt.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

class Malt: Codable {
    
	let amount: Amount?
	let name: String?
    var state: String = State.IDLE.rawValue
    
	enum CodingKeys: String, CodingKey {
		case amount
		case name
	}
    
    init() {
        amount = nil
        name = ""
        state = State.IDLE.rawValue
    }
    
    init(amount: Amount, name: String) {
        self.amount = amount
        self.name = name
    }
}
