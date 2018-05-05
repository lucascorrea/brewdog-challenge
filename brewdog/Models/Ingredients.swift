//
//  Ingredients.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

struct Ingredients: Codable {
    
	let hops: [Hop]?
	let malt: [Malt]?
	let yeast: String?

	enum CodingKeys: String, CodingKey {
		case hops = "hops"
		case malt = "malt"
		case yeast = "yeast"
	}

}
