//
//  Fermentation.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

struct Fermentation: Codable {
    
	let temp: Temp?

	enum CodingKeys: String, CodingKey {
		case temp
	}

}
