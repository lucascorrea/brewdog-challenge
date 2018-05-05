//
//  Hop.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

struct Hop: Codable {
    
	let add: String?
	let amount: Amount?
	let attribute: String?
	let name: String?

	enum CodingKeys: String, CodingKey {
		case add = "add"
		case amount
		case attribute = "attribute"
		case name = "name"
	}

}
