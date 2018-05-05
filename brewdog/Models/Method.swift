//
//  Method.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

struct Method: Codable {
    
	let fermentation: Fermentation?
	let mash: [Mash]?
	let twist: String?

	enum CodingKeys: String, CodingKey {
		case fermentation
		case mash = "mash_temp"
		case twist = "twist"
	}

}
