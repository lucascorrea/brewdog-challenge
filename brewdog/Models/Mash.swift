//
//  Mash.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

struct Mash: Codable {
    
	let duration: Int?
	let temp: Temp?

	enum CodingKeys: String, CodingKey {
		case duration = "duration"
		case temp
	}

}
