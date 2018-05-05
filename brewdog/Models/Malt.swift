//
//  Malt.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

struct Malt: Codable {
    
	let amount: Amount?
	let name: String?

	enum CodingKeys: String, CodingKey {
		case amount
		case name = "name"
	}
    
}
