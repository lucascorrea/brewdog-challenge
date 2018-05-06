//
//  Temp.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

struct Temp: Codable {
    
	let unit: String?
	let value: Int?

	enum CodingKeys: String, CodingKey {
		case unit
		case value
	}

}
