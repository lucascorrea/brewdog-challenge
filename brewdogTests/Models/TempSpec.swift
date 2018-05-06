//
//  TempSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class TempSpec: QuickSpec {
    
    override func spec() {
        
        beforeEach {
            
        }
        
        describe("Temp") {
            it("should create a new Temp") {
                let temp = Temp(unit: "celsius", value: 19)
                expect(temp).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
