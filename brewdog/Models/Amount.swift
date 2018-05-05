//
//  Amount.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

struct Amount: Codable {
    
	let unit: String?
	let value: Double?

	enum CodingKeys: String, CodingKey {
		case unit = "unit"
		case value = "value"
	}
    
}
