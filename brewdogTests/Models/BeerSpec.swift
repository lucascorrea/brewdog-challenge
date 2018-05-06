//
//  BeerSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class BeerSpec: QuickSpec {
    
    override func spec() {
        
        beforeEach {
            
        }
        
        describe("Beer") {
            it("should create a new Beer") {
                let beer = Beer()
                expect(beer).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
