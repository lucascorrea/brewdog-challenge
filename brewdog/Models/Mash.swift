//
//  Mash.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

enum MashState: String {
    case IDLE
    case RUNNING
    case PAUSE
    case DONE
}

class Mash: Codable {
    
	let duration: Int?
	let temp: Temp?
    var countDown: Int?
    var state: String = MashState.IDLE.rawValue
    
	enum CodingKeys: String, CodingKey {
		case duration
		case temp
        case countDown
	}

    init() {
        duration = 0
        temp = nil
        countDown = 0
    }
}
