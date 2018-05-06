//
//  HopSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class HopSpec: QuickSpec {
    
    override func spec() {
        
        beforeEach {
            
        }
        
        describe("Hop") {
            it("should create a new Hop") {
                let hop = Hop()
                expect(hop).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
