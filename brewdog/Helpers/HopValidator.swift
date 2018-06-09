//
//  HopValidator.swift
//  brewdog
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

class HopValidator {
    
    let hop: Hop
    let hopArray: [Hop]
    
    init(withHop hop:Hop, list:[Hop]) {
        self.hop = hop
        self.hopArray = list
    }
    
    func canChange() -> Bool {
    
        //A hop element with the attribute add=middle can’t be DONE until all the hops with add=start are done.
        //A hop element with the attribute add=end can’t be DONE until all the hops with add=middle are done.
        
        switch hop.add {
        case "middle":
            for hopItem in hopArray where hopItem.state == State.IDLE.rawValue &&
                hopItem.add == "start" {
                return false
            }
            return true
        case "end":
            for hopItem in hopArray where hopItem.state == State.IDLE.rawValue &&
                hopItem.add == "middle" {
                return false
            }
            return true
            
        default:
            return true
        }
    }
}
