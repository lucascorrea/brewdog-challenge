//
//  AmountSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class AmountSpec: QuickSpec {
    
    override func spec() {
        
        beforeEach {
            
        }
        
        describe("Amount") {
            it("should create a new Amount") {
                let amount = Amount(unit: "kilograms", value: 1.92)
                expect(amount).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
