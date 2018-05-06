//
//  MaltSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class MaltSpec: QuickSpec {
    
    override func spec() {
        
        beforeEach {
            
        }
        
        describe("Malt") {
            it("should create a new Malt") {
                let malt = Malt()
                expect(malt).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
