//
//  Hop.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

enum State: String {
    case IDLE
    case DONE
}

class Hop: Codable {
    
	let add: String?
	let amount: Amount?
	let attribute: String?
	let name: String?
    var state: String = State.IDLE.rawValue
    
	enum CodingKeys: String, CodingKey {
		case add = "add"
		case amount
		case attribute = "attribute"
		case name = "name"
	}
    
    init() {
        add = ""
        amount = nil
        attribute = ""
        name = ""
        state = State.IDLE.rawValue
    }

}
